import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/note.dart';
import '../utils/helpers.dart';

class NotesProvider with ChangeNotifier {
  NotesProvider() {
    init();
  }

  List<Note> _notes = [];

  List<Note> get notes => _notes;

  Isar? isar;

  void init() async {
    final dir = await getApplicationSupportDirectory();
    isar ??= await Isar.open(schemas: [NoteSchema], directory: dir.path);

    await isar!.txn((isar) async {
      final notesCollection = isar.notes;
      _notes = await notesCollection.where().findAll();
      notifyListeners();
    });
  }

  void addNote() async {
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

    _notes.add(note);
    notifyListeners();
  }

  Future<void> updateNote(Note note) async {
    note.updatedAt = currentTimestamp();

    await isar!.writeTxn((isar) async {
      await isar.notes.put(note);
    });

    notifyListeners();
  }
}
