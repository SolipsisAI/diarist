import 'package:realm/realm.dart';
import 'package:json_annotation/json_annotation.dart';

import '../components/notes_list.dart';

part 'note.g.dart';

const fieldMapping = {'date': 'createdAt', 'modifiedDate': 'updatedAt'};

@RealmModel()
@JsonSerializable()
class _Note {
  @PrimaryKey()
  late final String uuid;

  late DateTime createdAt;
  late DateTime updatedAt;
  late String text;
  late String? title;
  late String? sentimentLabel;
  late double? sentimentScore;
  late String? emotionLabel;
  late double? emotionScore;
  late String? actualSentimentLabel;
  late String? actualEmotionLabel;
  late DateTime? predictionUpdatedAt;

  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get emotion => actualEmotionLabel ?? emotionLabel;

  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get sentiment => actualSentimentLabel ?? sentimentLabel;

  NoteItem toItem() {
    return NoteItem(
        uuid,
        createdAt,
        updatedAt,
        text,
        title,
        sentimentLabel,
        sentimentScore,
        emotionLabel,
        emotionScore,
        actualSentimentLabel,
        actualEmotionLabel,
        predictionUpdatedAt,
        emotion,
        sentiment);
  }
}

extension NoteJ on Note {
  static Note toRealmObject(_Note note) {
    return Note(note.uuid, note.createdAt, note.updatedAt, note.text);
  }

  static Note fromJson(Map<String, dynamic> json) =>
      toRealmObject(_$NoteFromJson(json));
  Map<String, dynamic> toJson() => _$NoteToJson(this);

  static Note fromListRow(Map<dynamic, dynamic> row, List<String> headers) {
    final Map<String, dynamic> json = {};
    for (var i = 0; i < headers.length; i++) {
      var header = headers[i];

      if (fieldMapping.containsKey(header)) {
        header = fieldMapping[header]!;
      }

      json[header] = row[headers[i]];
    }
    return fromJson(json);
  }
}
