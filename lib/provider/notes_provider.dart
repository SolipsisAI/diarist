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

  Future<Prediction> updatePrediction(Note note, Prediction prediction) async {
    //note.emotion = prediction.emotion;
    //note.sentiment = prediction.sentiment;

    realm.write(() {
      prediction.note = note;
      realm.add<Prediction>(prediction, update: true);

      note.prediction = prediction;
      realm.add<Note>(note, update: true);
    });

    updateNote(note);

    print(
        'prediction ${prediction.uuid} ${prediction.note!.uuid} ${prediction.emotion} ${prediction.sentiment}');

    notifyListeners();
    return prediction;
  }
}
