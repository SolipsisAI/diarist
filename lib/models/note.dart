import 'package:realm/realm.dart';

// import 'package:diarist/components/notes_list.dart';
// import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@RealmModel()
// @JsonSerializable()
class _Note {
  @PrimaryKey()
  late final String uuid;

  late int createdAt;
  late int updatedAt;
  late String title;
  late String text;
  late String? emotion = "";
  late String? sentiment = "";

  // _Note();

  // NoteItem toItem() {
  //   return NoteItem(
  //       id!, createdAt, updatedAt, title, text, uuid, emotion, sentiment);
  // }

  // factory _Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
  // Map<String, dynamic> toJson() => _$NoteToJson(this);
}
