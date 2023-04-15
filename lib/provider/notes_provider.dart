import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import '../models/note.dart';
import '../models/prediction.dart';
import '../utils/helpers.dart';

class NotesProvider with ChangeNotifier {
  NotesProvider() {
    init();
  }

  List<Note> _notes = [];

  List<Note> get notes => _notes;

  void init() async {
    final config = Configuration([Note.schema, Prediction.schema]);
    final realm = Realm(config);
    final notesCollection =
        realm.query<Note>('TRUEPREDICATE SORT(createdAt DESC)');
    _notes = notesCollection.toList();
    notifyListeners();
  }

  Future<Note> addNote() async {
    final timestamp = currentTimestamp();
    final note = Note()
      ..createdAt = timestamp
      ..updatedAt = timestamp
      ..uuid = randomString()
      ..text = ""
      ..title = toDateString(timestamp);

    await isar!.writeTxn((isar) async {
      await isar.notes.put(note);
    });

    _notes.insert(0, note);
    notifyListeners();
    return note;
  }

  Future<Note> updateNote(Note note) async {
    print(note.uuid);
    note.updatedAt = currentTimestamp();

    await isar!.writeTxn((isar) async {
      await isar.notes.put(note);
    });

    final Note updatedNote = _notes.firstWhere((n) => n.id == note.id);
    updatedNote.text = note.text;

    notifyListeners();
    return note;
  }

  Future<Prediction> addPrediction(Note note, Prediction prediction) async {
    note.emotion = prediction.emotion;
    note.sentiment = prediction.sentiment;

    await isar!.writeTxn((isar) async {
      await isar.predictions.put(prediction);
      await isar.notes.put(note);
    });

    print(
        'prediction ${prediction.id} ${prediction.emotion} ${prediction.sentiment}');

    final Note updatedNote = _notes.firstWhere((n) => n.id == note.id);
    updatedNote.emotion = note.emotion;
    updatedNote.sentiment = note.sentiment;

    notifyListeners();
    return prediction;
  }
}
