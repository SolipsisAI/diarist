import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import '../models/note.dart';
import '../utils/helpers.dart';

class NotesProvider with ChangeNotifier {
  NotesProvider() {
    init();
  }

  List<Note> _notes = [];

  // Emotion Labels
  List<Note> _sadness = [];
  List<Note> _joy = [];
  List<Note> _love = [];
  List<Note> _anger = [];
  List<Note> _fear = [];
  List<Note> _surprise = [];

//  final team =
//    realm.query<Team>('name == \$0', ['Millennium Falcon Crew']).first;
// final humanCrewMembers = team.crew.query('name != \$0', ['Chewbacca']);

  List<Note> get notes => _notes;

  // Emotion labels
  List<Note> get sadness => _sadness;
  List<Note> get joy => _joy;
  List<Note> get love => _love;
  List<Note> get anger => _anger;
  List<Note> get fear => _fear;
  List<Note> get surprise => _surprise;

  late RealmResults<Note> notesCollection;
  late Realm realm;

  void init() async {
    final dir = await getAppSupportDir();
    final realmPath = '${dir.path}/default.realm';
    final config = Configuration.local([Note.schema], path: realmPath);
    realm = Realm(config);

    notesCollection = realm.query<Note>('TRUEPREDICATE SORT(createdAt DESC)');

    _notes = notesCollection.toList();

    _sadness =
        notesCollection.query('emotionLabel = \$0', ['sadness']).toList();
    _joy = notesCollection.query('emotionLabel = \$0', ['joy']).toList();
    _love = notesCollection.query('emotionLabel = \$0', ['love']).toList();
    _anger = notesCollection.query('emotionLabel = \$0', ['anger']).toList();
    _fear = notesCollection.query('emotionLabel = \$0', ['fear']).toList();
    _surprise =
        notesCollection.query('emotionLabel = \$0', ['surprise']).toList();

    notifyListeners();
  }

  Future<Note> addNote() async {
    final datetime = currentDateTime();
    final note = Note(randomString(), datetime, datetime, "");

    realm.write(() {
      realm.add(note);
    });

    _notes = notesCollection.toList();
    notifyListeners();

    return note;
  }

  Future<Note> updateNote(Note note,
      {Map<String, Object>? result, bool? updateDates = true}) async {
    realm.write(() {
      final bool shouldUpdateDates = updateDates != null && updateDates;
      if (shouldUpdateDates) {
        note.updatedAt = currentDateTime();
      }

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

  void upsertFromDict(Map<dynamic, dynamic> row, headers) {
    final Note note = NoteJ.fromListRow(row, headers);

    realm.write(() {
      realm.add<Note>(note, update: true);
    });

    _notes = notesCollection.toList();
    notifyListeners();
  }
}
