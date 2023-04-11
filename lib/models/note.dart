import 'package:diarist/components/notes_list.dart';
import 'package:diarist/models/prediction.dart';
import 'package:isar/isar.dart';

part 'note.g.dart';

@Collection()
class Note {
  @Id()
  int? id;

  late int createdAt;
  late int updatedAt;
  late String title;
  late String text;
  late String uuid;
  late String? emotion = "";
  late String? sentiment = "";

  NoteItem toItem() {
    return NoteItem(
        id!, createdAt, updatedAt, title, text, uuid, emotion, sentiment);
  }
}
