// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Note _$NoteFromJson(Map<String, dynamic> json) => _Note()
  ..uuid = json['uuid'] as String
  ..createdAt = DateTime.parse(json['createdAt'] as String)
  ..updatedAt = DateTime.parse(json['updatedAt'] as String)
  ..text = json['text'] as String
  ..title = json['title'] as String?
  ..sentimentLabel = json['sentimentLabel'] as String?
  ..sentimentScore = (json['sentimentScore'] as num?)?.toDouble()
  ..emotionLabel = json['emotionLabel'] as String?
  ..emotionScore = (json['emotionScore'] as num?)?.toDouble()
  ..actualSentimentLabel = json['actualSentimentLabel'] as String?
  ..actualEmotionLabel = json['actualEmotionLabel'] as String?
  ..predictionUpdatedAt = json['predictionUpdatedAt'] == null
      ? null
      : DateTime.parse(json['predictionUpdatedAt'] as String);

Map<String, dynamic> _$NoteToJson(_Note instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'text': instance.text,
      'title': instance.title,
      'sentimentLabel': instance.sentimentLabel,
      'sentimentScore': instance.sentimentScore,
      'emotionLabel': instance.emotionLabel,
      'emotionScore': instance.emotionScore,
      'actualSentimentLabel': instance.actualSentimentLabel,
      'actualEmotionLabel': instance.actualEmotionLabel,
      'predictionUpdatedAt': instance.predictionUpdatedAt?.toIso8601String(),
    };

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Note extends _Note with RealmEntity, RealmObjectBase, RealmObject {
  Note(
    String uuid,
    DateTime createdAt,
    DateTime updatedAt,
    String text, {
    String? title,
    String? sentimentLabel,
    double? sentimentScore,
    String? emotionLabel,
    double? emotionScore,
    String? actualSentimentLabel,
    String? actualEmotionLabel,
    DateTime? predictionUpdatedAt,
  }) {
    RealmObjectBase.set(this, 'uuid', uuid);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
    RealmObjectBase.set(this, 'text', text);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'sentimentLabel', sentimentLabel);
    RealmObjectBase.set(this, 'sentimentScore', sentimentScore);
    RealmObjectBase.set(this, 'emotionLabel', emotionLabel);
    RealmObjectBase.set(this, 'emotionScore', emotionScore);
    RealmObjectBase.set(this, 'actualSentimentLabel', actualSentimentLabel);
    RealmObjectBase.set(this, 'actualEmotionLabel', actualEmotionLabel);
    RealmObjectBase.set(this, 'predictionUpdatedAt', predictionUpdatedAt);
  }

  Note._();

  @override
  String get uuid => RealmObjectBase.get<String>(this, 'uuid') as String;
  @override
  set uuid(String value) => throw RealmUnsupportedSetError();

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  DateTime get updatedAt =>
      RealmObjectBase.get<DateTime>(this, 'updatedAt') as DateTime;
  @override
  set updatedAt(DateTime value) =>
      RealmObjectBase.set(this, 'updatedAt', value);

  @override
  String get text => RealmObjectBase.get<String>(this, 'text') as String;
  @override
  set text(String value) => RealmObjectBase.set(this, 'text', value);

  @override
  String? get title => RealmObjectBase.get<String>(this, 'title') as String?;
  @override
  set title(String? value) => RealmObjectBase.set(this, 'title', value);

  @override
  String? get sentimentLabel =>
      RealmObjectBase.get<String>(this, 'sentimentLabel') as String?;
  @override
  set sentimentLabel(String? value) =>
      RealmObjectBase.set(this, 'sentimentLabel', value);

  @override
  double? get sentimentScore =>
      RealmObjectBase.get<double>(this, 'sentimentScore') as double?;
  @override
  set sentimentScore(double? value) =>
      RealmObjectBase.set(this, 'sentimentScore', value);

  @override
  String? get emotionLabel =>
      RealmObjectBase.get<String>(this, 'emotionLabel') as String?;
  @override
  set emotionLabel(String? value) =>
      RealmObjectBase.set(this, 'emotionLabel', value);

  @override
  double? get emotionScore =>
      RealmObjectBase.get<double>(this, 'emotionScore') as double?;
  @override
  set emotionScore(double? value) =>
      RealmObjectBase.set(this, 'emotionScore', value);

  @override
  String? get actualSentimentLabel =>
      RealmObjectBase.get<String>(this, 'actualSentimentLabel') as String?;
  @override
  set actualSentimentLabel(String? value) =>
      RealmObjectBase.set(this, 'actualSentimentLabel', value);

  @override
  String? get actualEmotionLabel =>
      RealmObjectBase.get<String>(this, 'actualEmotionLabel') as String?;
  @override
  set actualEmotionLabel(String? value) =>
      RealmObjectBase.set(this, 'actualEmotionLabel', value);

  @override
  DateTime? get predictionUpdatedAt =>
      RealmObjectBase.get<DateTime>(this, 'predictionUpdatedAt') as DateTime?;
  @override
  set predictionUpdatedAt(DateTime? value) =>
      RealmObjectBase.set(this, 'predictionUpdatedAt', value);

  @override
  Stream<RealmObjectChanges<Note>> get changes =>
      RealmObjectBase.getChanges<Note>(this);

  @override
  Note freeze() => RealmObjectBase.freezeObject<Note>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Note._);
    return const SchemaObject(ObjectType.realmObject, Note, 'Note', [
      SchemaProperty('uuid', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('updatedAt', RealmPropertyType.timestamp),
      SchemaProperty('text', RealmPropertyType.string),
      SchemaProperty('title', RealmPropertyType.string, optional: true),
      SchemaProperty('sentimentLabel', RealmPropertyType.string,
          optional: true),
      SchemaProperty('sentimentScore', RealmPropertyType.double,
          optional: true),
      SchemaProperty('emotionLabel', RealmPropertyType.string, optional: true),
      SchemaProperty('emotionScore', RealmPropertyType.double, optional: true),
      SchemaProperty('actualSentimentLabel', RealmPropertyType.string,
          optional: true),
      SchemaProperty('actualEmotionLabel', RealmPropertyType.string,
          optional: true),
      SchemaProperty('predictionUpdatedAt', RealmPropertyType.timestamp,
          optional: true),
    ]);
  }
}
