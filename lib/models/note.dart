import 'package:isar/isar.dart';

part 'note.g.dart';

@Collection()
class Note {
  @Id()
  int? id;

  late int createdAt;
  late int updatedAt;
  late String text;
  late String uuid;
}
