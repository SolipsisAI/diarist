import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import 'chat_screen.dart';
import 'models/chat_message.dart';
import 'models/chat_user.dart';
import 'utils/isolate_utils.dart';
import 'utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationSupportDirectory();
  final Isar _isar = await Isar.open(
      schemas: [ChatMessageSchema, ChatUserSchema], directory: dir.path);
  final chatMessages = await _isar.chatMessages.where().findAll();

  // Load vocab
  final vocab = <String, dynamic>{};
  final emoVocab = await loadVocab('emotion_classification.vocab.txt');
  final sentVocab = await loadVocab('sentiment_classification.vocab.txt');
  vocab['emotion'] = emoVocab;
  vocab['sentiment'] = sentVocab;

  // Initialize Isolate
  RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
  ReceivePort rootIsolatePort = ReceivePort();

  Isolate.spawn(_isolateMain, [
    rootIsolateToken,
    rootIsolatePort.sendPort,
  ]);

  late Map<String, int> interpreters;
  rootIsolatePort.listen((message) {
    interpreters = message;
  });

  // Initialize IsolateUtils
  final IsolateUtils isolateUtils = IsolateUtils();
  await isolateUtils.start(rootIsolateToken, rootIsolatePort);

  runApp(Diarist(
    isar: _isar,
    chatMessages: chatMessages,
    interpreters: interpreters,
    vocab: vocab,
    isolateUtils: isolateUtils,
  ));
}

void _isolateMain(List<dynamic> args) async {
  RootIsolateToken rootIsolateToken = args[0];
  SendPort port = args[1];

  BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);
  final Interpreter emotionInterpreter =
      await Interpreter.fromAsset('models/emotion_classification.tflite');
  final Interpreter sentimentInterpreter =
      await Interpreter.fromAsset('models/sentiment_classification.tflite');

  port.send({
    'emotion': emotionInterpreter.address,
    'sentiment': sentimentInterpreter.address
  });
}

class Diarist extends StatelessWidget {
  const Diarist(
      {Key? key,
      required this.isar,
      required this.chatMessages,
      required this.interpreters,
      required this.vocab,
      required this.isolateUtils})
      : super(key: key);

  final Isar isar;
  final List<ChatMessage> chatMessages;
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
          home: ChatScreen(
              isar: isar,
              chatMessages: chatMessages,
              interpreters: interpreters,
              vocab: vocab,
              isolateUtils: isolateUtils),
        ));
  }
}
