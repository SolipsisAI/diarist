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
    final dir = await getAppSupportDir();
    final realmPath = '${dir.path}/default.realm';
    final config = Configuration.local([Note.schema], path: realmPath);
    realm = Realm(config);
    final notesCollection =
        realm.query<Note>('TRUEPREDICATE SORT(createdAt DESC)');
    _notes = notesCollection.toList();
    notifyListeners();
  }

  Future<Note> addNote() async {
    final datetime = currentDateTime();
    final note = Note(randomString(), datetime, datetime, "");

    realm.write(() {
      realm.add(note);
    });

    _notes.insert(0, note);
    notifyListeners();

    return note;
  }

  Future<Note> updateNote(Note note, {Map<String, Object>? result}) async {
    realm.write(() {
      note.updatedAt = currentDateTime();

      if (result != null) {
        note.emotionLabel = result['emotionLabel'] as String;
        note.emotionScore = result['emotionScore'] as double;
        note.sentimentLabel = result['sentimentLabel'] as String;
        note.sentimentScore = result['sentimentScore'] as double;
        note.predictionUpdatedAt = note.updatedAt;
      }

      realm.add<Note>(note, update: true);
    });

    notifyListeners();
    return note;
  }
}
