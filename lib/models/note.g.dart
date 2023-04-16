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
    String sentiment,
    double sentimentScore,
    String emotion,
    double emotionScore,
  ) {
    RealmObjectBase.set(this, 'uuid', uuid);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'sentiment', sentiment);
    RealmObjectBase.set(this, 'sentimentScore', sentimentScore);
    RealmObjectBase.set(this, 'emotion', emotion);
    RealmObjectBase.set(this, 'emotionScore', emotionScore);
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
  String get sentiment =>
      RealmObjectBase.get<String>(this, 'sentiment') as String;
  @override
  set sentiment(String value) => RealmObjectBase.set(this, 'sentiment', value);

  @override
  double get sentimentScore =>
      RealmObjectBase.get<double>(this, 'sentimentScore') as double;
  @override
  set sentimentScore(double value) =>
      RealmObjectBase.set(this, 'sentimentScore', value);

  @override
  String get emotion => RealmObjectBase.get<String>(this, 'emotion') as String;
  @override
  set emotion(String value) => RealmObjectBase.set(this, 'emotion', value);

  @override
  double get emotionScore =>
      RealmObjectBase.get<double>(this, 'emotionScore') as double;
  @override
  set emotionScore(double value) =>
      RealmObjectBase.set(this, 'emotionScore', value);

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
      SchemaProperty('sentiment', RealmPropertyType.string),
      SchemaProperty('sentimentScore', RealmPropertyType.double),
      SchemaProperty('emotion', RealmPropertyType.string),
      SchemaProperty('emotionScore', RealmPropertyType.double),
      SchemaProperty('linkedNote', RealmPropertyType.linkingObjects,
          linkOriginProperty: 'predictions',
          collectionType: RealmCollectionType.list,
          linkTarget: 'Note'),
    ]);
  }
}
