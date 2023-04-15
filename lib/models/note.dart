import 'package:realm/realm.dart';

part 'note.g.dart';

@RealmModel()
class _Note {
  @PrimaryKey()
  late final String uuid;

  late int createdAt;
  late int updatedAt;
  late String title;
  late String text;
  late String? emotion = "";
  late String? sentiment = "";

  // NoteItem toItem() {
  //   return NoteItem(
  //       id!, createdAt, updatedAt, title, text, uuid, emotion, sentiment);
  // }
}
