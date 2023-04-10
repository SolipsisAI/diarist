import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import 'app.dart';
import 'models/note.dart';
import 'models/prediction.dart';
import 'utils/isolate_utils.dart';
import 'utils/helpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationSupportDirectory();
  final Isar _isar = await Isar.open(
      schemas: [NoteSchema, PredictionSchema], directory: dir.path);
  final notes = await _isar.notes.where().sortByCreatedAtDesc().findAll();

  // Load interpreters
  final Interpreter emotionInterpreter =
      await Interpreter.fromAsset('models/emotion_classification.tflite');
  final Interpreter sentimentInterpreter =
      await Interpreter.fromAsset('models/sentiment_classification.tflite');
  final Map<String, int> interpreters = {
    'emotion': emotionInterpreter.address,
    'sentiment': sentimentInterpreter.address,
  };

  // Load vocab
  final vocab = <String, dynamic>{};
  final emotionVocab = await loadVocab('emotion_classification.vocab.txt');
  final sentimentVocab = await loadVocab('sentiment_classification.vocab.txt');
  vocab['emotion'] = emotionVocab;
  vocab['sentiment'] = sentimentVocab;

  // Initialize Isolate
  RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
  ReceivePort rootIsolatePort = ReceivePort();
  final IsolateUtils isolateUtils = IsolateUtils();
  await isolateUtils.start(rootIsolateToken, rootIsolatePort);

  runApp(Diarist(
    isar: _isar,
    notes: notes,
    interpreters: interpreters,
    vocab: vocab,
    isolateUtils: isolateUtils,
  ));
}

class Diarist extends StatelessWidget {
  const Diarist(
      {Key? key,
      required this.isar,
      required this.notes,
      required this.interpreters,
      required this.vocab,
      required this.isolateUtils})
      : super(key: key);

  final Isar isar;
  final List<Note> notes;
  final Map<String, int> interpreters;
  final Map<String, dynamic> vocab;
  final IsolateUtils isolateUtils;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: MaterialApp(
            title: 'Diarist',
            debugShowCheckedModeBanner: false,
            home: DiaristApp(
              isar: isar,
              notes: notes,
              interpreters: interpreters,
              vocab: vocab,
              isolateUtils: isolateUtils,
            )));
  }
}
