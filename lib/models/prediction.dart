import 'package:realm/realm.dart';

part 'prediction.g.dart';

@RealmModel()
class _Prediction {
  @PrimaryKey()
  late final String uuid;

  late int createdAt;
  late String sentiment;
  late double sentimentScore;
  late String emotion;
  late double emotionScore;
  late String noteUuid;
}
