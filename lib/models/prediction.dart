import 'package:diarist/models/note.dart';
import 'package:isar/isar.dart';

part 'prediction.g.dart';

@Collection()
class Prediction {
  @Id()
  int? id;

  late int createdAt;
  late String sentiment;
  late double sentimentScore;
  late String emotion;
  late double emotionScore;

  final note = IsarLink<Note>();
}
