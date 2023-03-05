import 'package:isar/isar.dart';

part 'prediction.g.dart';

@Collection()
class Prediction {
  @Id()
  int? id;

  late int chatMessageId;
  late int createdAt;
  late double sentiment;
  late double emotion;
}
