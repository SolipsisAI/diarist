// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_prediction.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetNotePredictionCollection on Isar {
  IsarCollection<NotePrediction> get notePredictions => getCollection();
}

const NotePredictionSchema = CollectionSchema(
  name: 'NotePrediction',
  schema:
      '{"name":"NotePrediction","idName":"id","properties":[{"name":"createdAt","type":"Long"},{"name":"emotion","type":"String"},{"name":"emotionScore","type":"Double"},{"name":"sentiment","type":"String"},{"name":"sentimentScore","type":"Double"},{"name":"updatedAt","type":"Long"}],"indexes":[],"links":[{"name":"note","target":"Note"}]}',
  idName: 'id',
  propertyIds: {
    'createdAt': 0,
    'emotion': 1,
    'emotionScore': 2,
    'sentiment': 3,
    'sentimentScore': 4,
    'updatedAt': 5
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'note': 0},
  backlinkLinkNames: {},
  getId: _notePredictionGetId,
  setId: _notePredictionSetId,
  getLinks: _notePredictionGetLinks,
  attachLinks: _notePredictionAttachLinks,
  serializeNative: _notePredictionSerializeNative,
  deserializeNative: _notePredictionDeserializeNative,
  deserializePropNative: _notePredictionDeserializePropNative,
  serializeWeb: _notePredictionSerializeWeb,
  deserializeWeb: _notePredictionDeserializeWeb,
  deserializePropWeb: _notePredictionDeserializePropWeb,
  version: 3,
);

int? _notePredictionGetId(NotePrediction object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _notePredictionSetId(NotePrediction object, int id) {
  object.id = id;
}

List<IsarLinkBase> _notePredictionGetLinks(NotePrediction object) {
  return [object.note];
}

void _notePredictionSerializeNative(
    IsarCollection<NotePrediction> collection,
    IsarRawObject rawObj,
    NotePrediction object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.createdAt;
  final _createdAt = value0;
  final value1 = object.emotion;
  final _emotion = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_emotion.length) as int;
  final value2 = object.emotionScore;
  final _emotionScore = value2;
  final value3 = object.sentiment;
  final _sentiment = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_sentiment.length) as int;
  final value4 = object.sentimentScore;
  final _sentimentScore = value4;
  final value5 = object.updatedAt;
  final _updatedAt = value5;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _createdAt);
  writer.writeBytes(offsets[1], _emotion);
  writer.writeDouble(offsets[2], _emotionScore);
  writer.writeBytes(offsets[3], _sentiment);
  writer.writeDouble(offsets[4], _sentimentScore);
  writer.writeLong(offsets[5], _updatedAt);
}

NotePrediction _notePredictionDeserializeNative(
    IsarCollection<NotePrediction> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = NotePrediction();
  object.createdAt = reader.readLong(offsets[0]);
  object.emotion = reader.readString(offsets[1]);
  object.emotionScore = reader.readDouble(offsets[2]);
  object.id = id;
  object.sentiment = reader.readString(offsets[3]);
  object.sentimentScore = reader.readDouble(offsets[4]);
  object.updatedAt = reader.readLong(offsets[5]);
  _notePredictionAttachLinks(collection, id, object);
  return object;
}

P _notePredictionDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _notePredictionSerializeWeb(
    IsarCollection<NotePrediction> collection, NotePrediction object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'createdAt', object.createdAt);
  IsarNative.jsObjectSet(jsObj, 'emotion', object.emotion);
  IsarNative.jsObjectSet(jsObj, 'emotionScore', object.emotionScore);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'sentiment', object.sentiment);
  IsarNative.jsObjectSet(jsObj, 'sentimentScore', object.sentimentScore);
  IsarNative.jsObjectSet(jsObj, 'updatedAt', object.updatedAt);
  return jsObj;
}

NotePrediction _notePredictionDeserializeWeb(
    IsarCollection<NotePrediction> collection, dynamic jsObj) {
  final object = NotePrediction();
  object.createdAt =
      IsarNative.jsObjectGet(jsObj, 'createdAt') ?? double.negativeInfinity;
  object.emotion = IsarNative.jsObjectGet(jsObj, 'emotion') ?? '';
  object.emotionScore =
      IsarNative.jsObjectGet(jsObj, 'emotionScore') ?? double.negativeInfinity;
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.sentiment = IsarNative.jsObjectGet(jsObj, 'sentiment') ?? '';
  object.sentimentScore = IsarNative.jsObjectGet(jsObj, 'sentimentScore') ??
      double.negativeInfinity;
  object.updatedAt =
      IsarNative.jsObjectGet(jsObj, 'updatedAt') ?? double.negativeInfinity;
  _notePredictionAttachLinks(
      collection, IsarNative.jsObjectGet(jsObj, 'id'), object);
  return object;
}

P _notePredictionDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'createdAt':
      return (IsarNative.jsObjectGet(jsObj, 'createdAt') ??
          double.negativeInfinity) as P;
    case 'emotion':
      return (IsarNative.jsObjectGet(jsObj, 'emotion') ?? '') as P;
    case 'emotionScore':
      return (IsarNative.jsObjectGet(jsObj, 'emotionScore') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'sentiment':
      return (IsarNative.jsObjectGet(jsObj, 'sentiment') ?? '') as P;
    case 'sentimentScore':
      return (IsarNative.jsObjectGet(jsObj, 'sentimentScore') ??
          double.negativeInfinity) as P;
    case 'updatedAt':
      return (IsarNative.jsObjectGet(jsObj, 'updatedAt') ??
          double.negativeInfinity) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _notePredictionAttachLinks(
    IsarCollection col, int id, NotePrediction object) {
  object.note.attach(col, col.isar.notes, 'note', id);
}

extension NotePredictionQueryWhereSort
    on QueryBuilder<NotePrediction, NotePrediction, QWhere> {
  QueryBuilder<NotePrediction, NotePrediction, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension NotePredictionQueryWhere
    on QueryBuilder<NotePrediction, NotePrediction, QWhereClause> {
  QueryBuilder<NotePrediction, NotePrediction, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterWhereClause> idNotEqualTo(
      int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterWhereClause> idLessThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension NotePredictionQueryFilter
    on QueryBuilder<NotePrediction, NotePrediction, QFilterCondition> {
  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      createdAtEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      createdAtGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      createdAtLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      createdAtBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'createdAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      emotionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'emotion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      emotionGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'emotion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      emotionLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'emotion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      emotionBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'emotion',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      emotionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'emotion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      emotionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'emotion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      emotionContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'emotion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      emotionMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'emotion',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      emotionScoreGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'emotionScore',
      value: value,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      emotionScoreLessThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'emotionScore',
      value: value,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      emotionScoreBetween(double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'emotionScore',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      sentimentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sentiment',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      sentimentGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sentiment',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      sentimentLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sentiment',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      sentimentBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sentiment',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      sentimentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'sentiment',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      sentimentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'sentiment',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      sentimentContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sentiment',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      sentimentMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'sentiment',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      sentimentScoreGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'sentimentScore',
      value: value,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      sentimentScoreLessThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'sentimentScore',
      value: value,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      sentimentScoreBetween(double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sentimentScore',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      updatedAtEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'updatedAt',
      value: value,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      updatedAtGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'updatedAt',
      value: value,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      updatedAtLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'updatedAt',
      value: value,
    ));
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition>
      updatedAtBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'updatedAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension NotePredictionQueryLinks
    on QueryBuilder<NotePrediction, NotePrediction, QFilterCondition> {
  QueryBuilder<NotePrediction, NotePrediction, QAfterFilterCondition> note(
      FilterQuery<Note> q) {
    return linkInternal(
      isar.notes,
      q,
      'note',
    );
  }
}

extension NotePredictionQueryWhereSortBy
    on QueryBuilder<NotePrediction, NotePrediction, QSortBy> {
  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy> sortByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy>
      sortByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy> sortByEmotion() {
    return addSortByInternal('emotion', Sort.asc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy>
      sortByEmotionDesc() {
    return addSortByInternal('emotion', Sort.desc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy>
      sortByEmotionScore() {
    return addSortByInternal('emotionScore', Sort.asc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy>
      sortByEmotionScoreDesc() {
    return addSortByInternal('emotionScore', Sort.desc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy> sortBySentiment() {
    return addSortByInternal('sentiment', Sort.asc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy>
      sortBySentimentDesc() {
    return addSortByInternal('sentiment', Sort.desc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy>
      sortBySentimentScore() {
    return addSortByInternal('sentimentScore', Sort.asc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy>
      sortBySentimentScoreDesc() {
    return addSortByInternal('sentimentScore', Sort.desc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy> sortByUpdatedAt() {
    return addSortByInternal('updatedAt', Sort.asc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return addSortByInternal('updatedAt', Sort.desc);
  }
}

extension NotePredictionQueryWhereSortThenBy
    on QueryBuilder<NotePrediction, NotePrediction, QSortThenBy> {
  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy> thenByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy>
      thenByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy> thenByEmotion() {
    return addSortByInternal('emotion', Sort.asc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy>
      thenByEmotionDesc() {
    return addSortByInternal('emotion', Sort.desc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy>
      thenByEmotionScore() {
    return addSortByInternal('emotionScore', Sort.asc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy>
      thenByEmotionScoreDesc() {
    return addSortByInternal('emotionScore', Sort.desc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy> thenBySentiment() {
    return addSortByInternal('sentiment', Sort.asc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy>
      thenBySentimentDesc() {
    return addSortByInternal('sentiment', Sort.desc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy>
      thenBySentimentScore() {
    return addSortByInternal('sentimentScore', Sort.asc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy>
      thenBySentimentScoreDesc() {
    return addSortByInternal('sentimentScore', Sort.desc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy> thenByUpdatedAt() {
    return addSortByInternal('updatedAt', Sort.asc);
  }

  QueryBuilder<NotePrediction, NotePrediction, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return addSortByInternal('updatedAt', Sort.desc);
  }
}

extension NotePredictionQueryWhereDistinct
    on QueryBuilder<NotePrediction, NotePrediction, QDistinct> {
  QueryBuilder<NotePrediction, NotePrediction, QDistinct>
      distinctByCreatedAt() {
    return addDistinctByInternal('createdAt');
  }

  QueryBuilder<NotePrediction, NotePrediction, QDistinct> distinctByEmotion(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('emotion', caseSensitive: caseSensitive);
  }

  QueryBuilder<NotePrediction, NotePrediction, QDistinct>
      distinctByEmotionScore() {
    return addDistinctByInternal('emotionScore');
  }

  QueryBuilder<NotePrediction, NotePrediction, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<NotePrediction, NotePrediction, QDistinct> distinctBySentiment(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('sentiment', caseSensitive: caseSensitive);
  }

  QueryBuilder<NotePrediction, NotePrediction, QDistinct>
      distinctBySentimentScore() {
    return addDistinctByInternal('sentimentScore');
  }

  QueryBuilder<NotePrediction, NotePrediction, QDistinct>
      distinctByUpdatedAt() {
    return addDistinctByInternal('updatedAt');
  }
}

extension NotePredictionQueryProperty
    on QueryBuilder<NotePrediction, NotePrediction, QQueryProperty> {
  QueryBuilder<NotePrediction, int, QQueryOperations> createdAtProperty() {
    return addPropertyNameInternal('createdAt');
  }

  QueryBuilder<NotePrediction, String, QQueryOperations> emotionProperty() {
    return addPropertyNameInternal('emotion');
  }

  QueryBuilder<NotePrediction, double, QQueryOperations>
      emotionScoreProperty() {
    return addPropertyNameInternal('emotionScore');
  }

  QueryBuilder<NotePrediction, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<NotePrediction, String, QQueryOperations> sentimentProperty() {
    return addPropertyNameInternal('sentiment');
  }

  QueryBuilder<NotePrediction, double, QQueryOperations>
      sentimentScoreProperty() {
    return addPropertyNameInternal('sentimentScore');
  }

  QueryBuilder<NotePrediction, int, QQueryOperations> updatedAtProperty() {
    return addPropertyNameInternal('updatedAt');
  }
}
