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

  @JsonKey(includeFromJson: false, includeToJson: false)
  String get emotion => predictions.isNotEmpty ? predictions.first.emotion : "";

  @JsonKey(includeFromJson: false, includeToJson: false)
  String get sentiment =>
      predictions.isNotEmpty ? predictions.first.sentiment : "";

  @JsonKey(includeFromJson: false, includeToJson: false)
  late List<_Prediction> predictions;

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
      note.text,
    );
  }

  static Note fromJson(Map<String, dynamic> json) =>
      toRealmObject(_$NoteFromJson(json));
  Map<String, dynamic> toJson() => _$NoteToJson(this);
}

@RealmModel()
class _Prediction {
  @PrimaryKey()
  late final String uuid;

  late int createdAt;
  late String sentiment;
  late double sentimentScore;
  late String emotion;
  late double emotionScore;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @Backlink(#predictions)
  late Iterable<_Note> linkedNote;
}
