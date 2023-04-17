// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Note _$NoteFromJson(Map<String, dynamic> json) => _Note()
  ..uuid = json['uuid'] as String
  ..createdAt = json['createdAt'] as int
  ..updatedAt = json['updatedAt'] as int
  ..title = json['title'] as String
  ..text = json['text'] as String;

Map<String, dynamic> _$NoteToJson(_Note instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'title': instance.title,
      'text': instance.text,
    };

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Note extends _Note with RealmEntity, RealmObjectBase, RealmObject {
  Note(
    String uuid,
    int createdAt,
    int updatedAt,
    String title,
    String text, {
    Iterable<Prediction> predictions = const [],
  }) {
    RealmObjectBase.set(this, 'uuid', uuid);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'text', text);
    RealmObjectBase.set<RealmList<Prediction>>(
        this, 'predictions', RealmList<Prediction>(predictions));
  }

  Note._();

  @override
  String get uuid => RealmObjectBase.get<String>(this, 'uuid') as String;
  @override
  set uuid(String value) => throw RealmUnsupportedSetError();

  @override
  int get createdAt => RealmObjectBase.get<int>(this, 'createdAt') as int;
  @override
  set createdAt(int value) => RealmObjectBase.set(this, 'createdAt', value);

  @override
  int get updatedAt => RealmObjectBase.get<int>(this, 'updatedAt') as int;
  @override
  set updatedAt(int value) => RealmObjectBase.set(this, 'updatedAt', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get text => RealmObjectBase.get<String>(this, 'text') as String;
  @override
  set text(String value) => RealmObjectBase.set(this, 'text', value);

  @override
  RealmList<Prediction> get predictions =>
      RealmObjectBase.get<Prediction>(this, 'predictions')
          as RealmList<Prediction>;
  @override
  set predictions(covariant RealmList<Prediction> value) =>
      throw RealmUnsupportedSetError();

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
      SchemaProperty('createdAt', RealmPropertyType.int),
      SchemaProperty('updatedAt', RealmPropertyType.int),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('text', RealmPropertyType.string),
      SchemaProperty('predictions', RealmPropertyType.object,
          linkTarget: 'Prediction', collectionType: RealmCollectionType.list),
    ]);
  }
}

class Prediction extends _Prediction
    with RealmEntity, RealmObjectBase, RealmObject {
  Prediction(
    String uuid,
    int createdAt,
    String sentimentLabel,
    double sentimentScore,
    String emotionLabel,
    double emotionScore, {
    String? actualSentimentLabel,
    String? actualEmotionLabel,
  }) {
    RealmObjectBase.set(this, 'uuid', uuid);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'sentimentLabel', sentimentLabel);
    RealmObjectBase.set(this, 'sentimentScore', sentimentScore);
    RealmObjectBase.set(this, 'emotionLabel', emotionLabel);
    RealmObjectBase.set(this, 'emotionScore', emotionScore);
    RealmObjectBase.set(this, 'actualSentimentLabel', actualSentimentLabel);
    RealmObjectBase.set(this, 'actualEmotionLabel', actualEmotionLabel);
  }

  Prediction._();

  @override
  String get uuid => RealmObjectBase.get<String>(this, 'uuid') as String;
  @override
  set uuid(String value) => throw RealmUnsupportedSetError();

  @override
  int get createdAt => RealmObjectBase.get<int>(this, 'createdAt') as int;
  @override
  set createdAt(int value) => RealmObjectBase.set(this, 'createdAt', value);

  @override
  String get sentimentLabel =>
      RealmObjectBase.get<String>(this, 'sentimentLabel') as String;
  @override
  set sentimentLabel(String value) =>
      RealmObjectBase.set(this, 'sentimentLabel', value);

  @override
  double get sentimentScore =>
      RealmObjectBase.get<double>(this, 'sentimentScore') as double;
  @override
  set sentimentScore(double value) =>
      RealmObjectBase.set(this, 'sentimentScore', value);

  @override
  String get emotionLabel =>
      RealmObjectBase.get<String>(this, 'emotionLabel') as String;
  @override
  set emotionLabel(String value) =>
      RealmObjectBase.set(this, 'emotionLabel', value);

  @override
  double get emotionScore =>
      RealmObjectBase.get<double>(this, 'emotionScore') as double;
  @override
  set emotionScore(double value) =>
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
  RealmResults<Note> get linkedNote =>
      RealmObjectBase.get<Note>(this, 'linkedNote') as RealmResults<Note>;
  @override
  set linkedNote(covariant RealmResults<Note> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Prediction>> get changes =>
      RealmObjectBase.getChanges<Prediction>(this);

  @override
  Prediction freeze() => RealmObjectBase.freezeObject<Prediction>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Prediction._);
    return const SchemaObject(
        ObjectType.realmObject, Prediction, 'Prediction', [
      SchemaProperty('uuid', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('createdAt', RealmPropertyType.int),
      SchemaProperty('sentimentLabel', RealmPropertyType.string),
      SchemaProperty('sentimentScore', RealmPropertyType.double),
      SchemaProperty('emotionLabel', RealmPropertyType.string),
      SchemaProperty('emotionScore', RealmPropertyType.double),
      SchemaProperty('actualSentimentLabel', RealmPropertyType.string,
          optional: true),
      SchemaProperty('actualEmotionLabel', RealmPropertyType.string,
          optional: true),
      SchemaProperty('linkedNote', RealmPropertyType.linkingObjects,
          linkOriginProperty: 'predictions',
          collectionType: RealmCollectionType.list,
          linkTarget: 'Note'),
    ]);
  }
}
