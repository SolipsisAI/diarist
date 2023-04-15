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

  late Realm realm;

  void init() async {
    final config = Configuration([Note.schema, Prediction.schema]);
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
    print(note.uuid);

    realm.write(() {
      note.updatedAt = currentTimestamp();
    });

    final Note updatedNote = _notes.firstWhere((n) => n.uuid == note.uuid);
    updatedNote.text = note.text;

    notifyListeners();
    return note;
  }

  Future<Prediction> addPrediction(Note note, Prediction prediction) async {
    realm.write(() {
      note.emotion = prediction.emotion;
      note.sentiment = prediction.sentiment;
      prediction.noteUuid = note.uuid;
    });

    print(
        'prediction ${prediction.uuid} ${prediction.noteUuid} ${prediction.emotion} ${prediction.sentiment}');

    final Note updatedNote = _notes.firstWhere((n) => n.uuid == note.uuid);
    updatedNote.emotion = note.emotion;
    updatedNote.sentiment = note.sentiment;

    notifyListeners();
    return prediction;
  }
}
