import 'package:isar/isar.dart';

part 'prediction.g.dart';

@Collection()
class Prediction {
  @Id()
  int? id;

  late int chatMessageId;
  late int createdAt;
  late String sentiment;
  late double sentimentScore;
  late String emotion;
  late double emotionScore;
}
