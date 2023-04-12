import 'dart:io';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/note.dart';
import '../models/prediction.dart';
import '../utils/helpers.dart';

class NotesProvider with ChangeNotifier {
  NotesProvider() {
    init();
  }

  List<Note> _notes = [];

  List<Note> get notes => _notes;

  Isar? isar;

  void init() async {
    final dir = await getApplicationDocumentsDirectory();
    final appDocDir = await Directory('${dir.path}/Diarist').create(recursive: true);
    
    print('appDocDir: ${appDocDir.path}');

    isar ??= await Isar.open(
        schemas: [NoteSchema, PredictionSchema], directory: appDocDir.path);

    await isar!.txn((isar) async {
      final notesCollection = isar.notes;
      _notes = await notesCollection.where().sortByCreatedAtDesc().findAll();
      notifyListeners();
    });
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

    return prediction;
  }
}
