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

class Note extends _Note with RealmEntity, RealmObjectBase, RealmObject {
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
      _defaultsSet = RealmObjectBase.setDefaults<Note>({
        'emotion': "",
        'sentiment': "",
      });
    }
    RealmObjectBase.set(this, 'uuid', uuid);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'text', text);
    RealmObjectBase.set(this, 'emotion', emotion);
    RealmObjectBase.set(this, 'sentiment', sentiment);
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
  String? get emotion =>
      RealmObjectBase.get<String>(this, 'emotion') as String?;
  @override
  set emotion(String? value) => RealmObjectBase.set(this, 'emotion', value);

  @override
  String? get sentiment =>
      RealmObjectBase.get<String>(this, 'sentiment') as String?;
  @override
  set sentiment(String? value) => RealmObjectBase.set(this, 'sentiment', value);

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
      SchemaProperty('emotion', RealmPropertyType.string, optional: true),
      SchemaProperty('sentiment', RealmPropertyType.string, optional: true),
    ]);
  }
}
