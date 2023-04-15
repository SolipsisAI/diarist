// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Prediction extends _Prediction
    with RealmEntity, RealmObjectBase, RealmObject {
  Prediction(
    String uuid,
    int createdAt,
    String sentiment,
    double sentimentScore,
    String emotion,
    double emotionScore,
    String noteUuid,
  ) {
    RealmObjectBase.set(this, 'uuid', uuid);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'sentiment', sentiment);
    RealmObjectBase.set(this, 'sentimentScore', sentimentScore);
    RealmObjectBase.set(this, 'emotion', emotion);
    RealmObjectBase.set(this, 'emotionScore', emotionScore);
    RealmObjectBase.set(this, 'noteUuid', noteUuid);
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
  String get noteUuid =>
      RealmObjectBase.get<String>(this, 'noteUuid') as String;
  @override
  set noteUuid(String value) => RealmObjectBase.set(this, 'noteUuid', value);

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
      SchemaProperty('noteUuid', RealmPropertyType.string),
    ]);
  }
}
