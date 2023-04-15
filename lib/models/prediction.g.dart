// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Prediction extends _Prediction with RealmEntity, RealmObject {
  Prediction(
    String uuid,
    int createdAt,
    String sentiment,
    double sentimentScore,
    String emotion,
    double emotionScore,
    String noteUuid,
  ) {
    RealmObject.set(this, 'uuid', uuid);
    RealmObject.set(this, 'createdAt', createdAt);
    RealmObject.set(this, 'sentiment', sentiment);
    RealmObject.set(this, 'sentimentScore', sentimentScore);
    RealmObject.set(this, 'emotion', emotion);
    RealmObject.set(this, 'emotionScore', emotionScore);
    RealmObject.set(this, 'noteUuid', noteUuid);
  }

  Prediction._();

  @override
  String get uuid => RealmObject.get<String>(this, 'uuid') as String;
  @override
  set uuid(String value) => throw RealmUnsupportedSetError();

  @override
  int get createdAt => RealmObject.get<int>(this, 'createdAt') as int;
  @override
  set createdAt(int value) => RealmObject.set(this, 'createdAt', value);

  @override
  String get sentiment => RealmObject.get<String>(this, 'sentiment') as String;
  @override
  set sentiment(String value) => RealmObject.set(this, 'sentiment', value);

  @override
  double get sentimentScore =>
      RealmObject.get<double>(this, 'sentimentScore') as double;
  @override
  set sentimentScore(double value) =>
      RealmObject.set(this, 'sentimentScore', value);

  @override
  String get emotion => RealmObject.get<String>(this, 'emotion') as String;
  @override
  set emotion(String value) => RealmObject.set(this, 'emotion', value);

  @override
  double get emotionScore =>
      RealmObject.get<double>(this, 'emotionScore') as double;
  @override
  set emotionScore(double value) =>
      RealmObject.set(this, 'emotionScore', value);

  @override
  String get noteUuid => RealmObject.get<String>(this, 'noteUuid') as String;
  @override
  set noteUuid(String value) => RealmObject.set(this, 'noteUuid', value);

  @override
  Stream<RealmObjectChanges<Prediction>> get changes =>
      RealmObject.getChanges<Prediction>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Prediction._);
    return const SchemaObject(Prediction, [
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
