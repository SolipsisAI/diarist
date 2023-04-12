import 'package:diarist/components/notes_list.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@Collection()
@JsonSerializable()
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

  Note();

  NoteItem toItem() {
    return NoteItem(
        id!, createdAt, updatedAt, title, text, uuid, emotion, sentiment);
  }

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
  Map<String, dynamic> toJson() => _$NoteToJson(this);
}
