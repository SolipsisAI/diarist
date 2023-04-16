import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import '../models/note.dart';
import '../utils/helpers.dart';

class NotesProvider with ChangeNotifier {
  NotesProvider() {
    init();
  }

  List<Note> _notes = [];

  List<Note> get notes => _notes;

  late Realm realm;

  void init() async {
    final config = Configuration.local([Note.schema, Prediction.schema]);
    realm = Realm(config);
    final notesCollection =
        realm.query<Note>('TRUEPREDICATE SORT(createdAt DESC)');
    _notes = notesCollection.toList();
    notifyListeners();
  }

  Future<Note> addNote() async {
    final timestamp = currentTimestamp();
    final note =
        Note(randomString(), timestamp, timestamp, toDateString(timestamp), "");

    realm.write(() {
      realm.add(note);
    });

    _notes.insert(0, note);
    notifyListeners();

    return note;
  }

  Future<Note> updateNote(Note note) async {
    realm.write(() {
      note.updatedAt = currentTimestamp();
      realm.add<Note>(note, update: true);
    });

    notifyListeners();
    return note;
  }

  Future<Prediction> updatePrediction(Note note, Map<String, Object> result) async {
    final Prediction prediction = Prediction(
      note.prediction?.uuid ?? randomString(),
      currentTimestamp(),
      result['sentiment'] as String,
      result['sentimentScore'] as double,
      result['emotion'] as String,
      result['emotionScore'] as double,
    );

    realm.write(() {
      note.prediction = prediction;
      note.sentiment = note.prediction!.sentiment;
      note.emotion = note.prediction!.emotion;
      realm.add<Note>(note, update: true);
    });

    print(
        'prediction ${prediction.uuid} ${prediction.emotion} ${prediction.sentiment} for note ${note.uuid}');

    notifyListeners();
    return prediction;
  }
}
