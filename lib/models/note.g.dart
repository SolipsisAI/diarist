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
  ..text = json['text'] as String
  ..emotion = json['emotion'] as String?
  ..sentiment = json['sentiment'] as String?;

Map<String, dynamic> _$NoteToJson(_Note instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'title': instance.title,
      'text': instance.text,
      'emotion': instance.emotion,
      'sentiment': instance.sentiment,
    };

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Note extends _Note with RealmEntity, RealmObject {
  static var _defaultsSet = false;

  Note(
    String uuid,
    int createdAt,
    int updatedAt,
    String title,
    String text, {
    String? emotion = "",
    String? sentiment = "",
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObject.setDefaults<Note>({
        'emotion': "",
        'sentiment': "",
      });
    }
    RealmObject.set(this, 'uuid', uuid);
    RealmObject.set(this, 'createdAt', createdAt);
    RealmObject.set(this, 'updatedAt', updatedAt);
    RealmObject.set(this, 'title', title);
    RealmObject.set(this, 'text', text);
    RealmObject.set(this, 'emotion', emotion);
    RealmObject.set(this, 'sentiment', sentiment);
  }

  Note._();

  @override
  String get uuid => RealmObject.get<String>(this, 'uuid') as String;
  @override
  set uuid(String value) => throw RealmUnsupportedSetError();

  @override
  int get createdAt => RealmObject.get<int>(this, 'createdAt') as int;
  @override
  set createdAt(int value) => RealmObject.set(this, 'createdAt', value);

  @override
  int get updatedAt => RealmObject.get<int>(this, 'updatedAt') as int;
  @override
  set updatedAt(int value) => RealmObject.set(this, 'updatedAt', value);

  @override
  String get title => RealmObject.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObject.set(this, 'title', value);

  @override
  String get text => RealmObject.get<String>(this, 'text') as String;
  @override
  set text(String value) => RealmObject.set(this, 'text', value);

  @override
  String? get emotion => RealmObject.get<String>(this, 'emotion') as String?;
  @override
  set emotion(String? value) => RealmObject.set(this, 'emotion', value);

  @override
  String? get sentiment =>
      RealmObject.get<String>(this, 'sentiment') as String?;
  @override
  set sentiment(String? value) => RealmObject.set(this, 'sentiment', value);

  @override
  Stream<RealmObjectChanges<Note>> get changes =>
      RealmObject.getChanges<Note>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObject.registerFactory(Note._);
    return const SchemaObject(Note, [
      SchemaProperty('uuid', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('createdAt', RealmPropertyType.int),
      SchemaProperty('updatedAt', RealmPropertyType.int),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('text', RealmPropertyType.string),
      SchemaProperty('emotion', RealmPropertyType.string, optional: true),
      SchemaProperty('sentiment', RealmPropertyType.string, optional: true),
    ]);
  }
}
