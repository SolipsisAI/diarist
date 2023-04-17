import 'package:realm/realm.dart';
import 'package:json_annotation/json_annotation.dart';

import '../components/notes_list.dart';

part 'note.g.dart';

@RealmModel()
@JsonSerializable()
class _Note {
  @PrimaryKey()
  late final String uuid;

  late int createdAt;
  late int updatedAt;
  late String title;
  late String text;
  late String? sentimentLabel;
  late double? sentimentScore;
  late String? emotionLabel;
  late double? emotionScore;
  late String? actualSentimentLabel;
  late String? actualEmotionLabel;
  late int? predictionUpdatedAt;

  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get emotion => actualEmotionLabel ?? emotionLabel;

  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get sentiment => actualSentimentLabel ?? sentimentLabel;

  NoteItem toItem() {
    return NoteItem(
        uuid, createdAt, updatedAt, title, text, emotion, sentiment);
  }
}

extension NoteJ on Note {
  static Note toRealmObject(_Note note) {
    return Note(
      note.uuid,
      note.createdAt,
      note.updatedAt,
      note.title,
      note.text
    );
  }

  static Note fromJson(Map<String, dynamic> json) =>
      toRealmObject(_$NoteFromJson(json));
  Map<String, dynamic> toJson() => _$NoteToJson(this);
}
