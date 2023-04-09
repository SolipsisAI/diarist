import 'package:diarist/models/note.dart';
import 'package:isar/isar.dart';

part 'note_prediction.g.dart';

@Collection()
class NotePrediction {
  @Id()
  int? id;

  late int createdAt;
  late int updatedAt;
  late String sentiment;
  late double sentimentScore;
  late String emotion;
  late double emotionScore;

  final note = IsarLink<Note>();
}
