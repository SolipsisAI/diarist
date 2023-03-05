// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetPredictionCollection on Isar {
  IsarCollection<Prediction> get predictions => getCollection();
}

const PredictionSchema = CollectionSchema(
  name: 'Prediction',
  schema:
      '{"name":"Prediction","idName":"id","properties":[{"name":"chatMessageId","type":"Long"},{"name":"createdAt","type":"Long"},{"name":"emotion","type":"String"},{"name":"sentiment","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'chatMessageId': 0,
    'createdAt': 1,
    'emotion': 2,
    'sentiment': 3
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _predictionGetId,
  setId: _predictionSetId,
  getLinks: _predictionGetLinks,
  attachLinks: _predictionAttachLinks,
  serializeNative: _predictionSerializeNative,
  deserializeNative: _predictionDeserializeNative,
  deserializePropNative: _predictionDeserializePropNative,
  serializeWeb: _predictionSerializeWeb,
  deserializeWeb: _predictionDeserializeWeb,
  deserializePropWeb: _predictionDeserializePropWeb,
  version: 3,
);

int? _predictionGetId(Prediction object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _predictionSetId(Prediction object, int id) {
  object.id = id;
}

List<IsarLinkBase> _predictionGetLinks(Prediction object) {
  return [];
}

void _predictionSerializeNative(
    IsarCollection<Prediction> collection,
    IsarRawObject rawObj,
    Prediction object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.chatMessageId;
  final _chatMessageId = value0;
  final value1 = object.createdAt;
  final _createdAt = value1;
  final value2 = object.emotion;
  final _emotion = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_emotion.length) as int;
  final value3 = object.sentiment;
  final _sentiment = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_sentiment.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _chatMessageId);
  writer.writeLong(offsets[1], _createdAt);
  writer.writeBytes(offsets[2], _emotion);
  writer.writeBytes(offsets[3], _sentiment);
}

Prediction _predictionDeserializeNative(IsarCollection<Prediction> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = Prediction();
  object.chatMessageId = reader.readLong(offsets[0]);
  object.createdAt = reader.readLong(offsets[1]);
  object.emotion = reader.readString(offsets[2]);
  object.id = id;
  object.sentiment = reader.readString(offsets[3]);
  return object;
}

P _predictionDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _predictionSerializeWeb(
    IsarCollection<Prediction> collection, Prediction object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'chatMessageId', object.chatMessageId);
  IsarNative.jsObjectSet(jsObj, 'createdAt', object.createdAt);
  IsarNative.jsObjectSet(jsObj, 'emotion', object.emotion);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'sentiment', object.sentiment);
  return jsObj;
}

Prediction _predictionDeserializeWeb(
    IsarCollection<Prediction> collection, dynamic jsObj) {
  final object = Prediction();
  object.chatMessageId =
      IsarNative.jsObjectGet(jsObj, 'chatMessageId') ?? double.negativeInfinity;
  object.createdAt =
      IsarNative.jsObjectGet(jsObj, 'createdAt') ?? double.negativeInfinity;
  object.emotion = IsarNative.jsObjectGet(jsObj, 'emotion') ?? '';
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.sentiment = IsarNative.jsObjectGet(jsObj, 'sentiment') ?? '';
  return object;
}

P _predictionDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'chatMessageId':
      return (IsarNative.jsObjectGet(jsObj, 'chatMessageId') ??
          double.negativeInfinity) as P;
    case 'createdAt':
      return (IsarNative.jsObjectGet(jsObj, 'createdAt') ??
          double.negativeInfinity) as P;
    case 'emotion':
      return (IsarNative.jsObjectGet(jsObj, 'emotion') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'sentiment':
      return (IsarNative.jsObjectGet(jsObj, 'sentiment') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _predictionAttachLinks(IsarCollection col, int id, Prediction object) {}

extension PredictionQueryWhereSort
    on QueryBuilder<Prediction, Prediction, QWhere> {
  QueryBuilder<Prediction, Prediction, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension PredictionQueryWhere
    on QueryBuilder<Prediction, Prediction, QWhereClause> {
  QueryBuilder<Prediction, Prediction, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Prediction, Prediction, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Prediction, Prediction, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Prediction, Prediction, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Prediction, Prediction, QAfterWhereClause> idBetween(
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

extension PredictionQueryFilter
    on QueryBuilder<Prediction, Prediction, QFilterCondition> {
  QueryBuilder<Prediction, Prediction, QAfterFilterCondition>
      chatMessageIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'chatMessageId',
      value: value,
    ));
  }

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition>
      chatMessageIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'chatMessageId',
      value: value,
    ));
  }

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition>
      chatMessageIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'chatMessageId',
      value: value,
    ));
  }

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition>
      chatMessageIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'chatMessageId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> createdAtEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition>
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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> emotionEqualTo(
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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition>
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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> emotionLessThan(
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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> emotionBetween(
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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> emotionStartsWith(
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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> emotionEndsWith(
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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> emotionContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'emotion',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> emotionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'emotion',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> sentimentEqualTo(
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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition>
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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> sentimentLessThan(
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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> sentimentBetween(
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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition>
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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> sentimentEndsWith(
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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> sentimentContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sentiment',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> sentimentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'sentiment',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension PredictionQueryLinks
    on QueryBuilder<Prediction, Prediction, QFilterCondition> {}

extension PredictionQueryWhereSortBy
    on QueryBuilder<Prediction, Prediction, QSortBy> {
  QueryBuilder<Prediction, Prediction, QAfterSortBy> sortByChatMessageId() {
    return addSortByInternal('chatMessageId', Sort.asc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> sortByChatMessageIdDesc() {
    return addSortByInternal('chatMessageId', Sort.desc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> sortByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> sortByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> sortByEmotion() {
    return addSortByInternal('emotion', Sort.asc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> sortByEmotionDesc() {
    return addSortByInternal('emotion', Sort.desc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> sortBySentiment() {
    return addSortByInternal('sentiment', Sort.asc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> sortBySentimentDesc() {
    return addSortByInternal('sentiment', Sort.desc);
  }
}

extension PredictionQueryWhereSortThenBy
    on QueryBuilder<Prediction, Prediction, QSortThenBy> {
  QueryBuilder<Prediction, Prediction, QAfterSortBy> thenByChatMessageId() {
    return addSortByInternal('chatMessageId', Sort.asc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> thenByChatMessageIdDesc() {
    return addSortByInternal('chatMessageId', Sort.desc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> thenByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> thenByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> thenByEmotion() {
    return addSortByInternal('emotion', Sort.asc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> thenByEmotionDesc() {
    return addSortByInternal('emotion', Sort.desc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> thenBySentiment() {
    return addSortByInternal('sentiment', Sort.asc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> thenBySentimentDesc() {
    return addSortByInternal('sentiment', Sort.desc);
  }
}

extension PredictionQueryWhereDistinct
    on QueryBuilder<Prediction, Prediction, QDistinct> {
  QueryBuilder<Prediction, Prediction, QDistinct> distinctByChatMessageId() {
    return addDistinctByInternal('chatMessageId');
  }

  QueryBuilder<Prediction, Prediction, QDistinct> distinctByCreatedAt() {
    return addDistinctByInternal('createdAt');
  }

  QueryBuilder<Prediction, Prediction, QDistinct> distinctByEmotion(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('emotion', caseSensitive: caseSensitive);
  }

  QueryBuilder<Prediction, Prediction, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Prediction, Prediction, QDistinct> distinctBySentiment(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('sentiment', caseSensitive: caseSensitive);
  }
}

extension PredictionQueryProperty
    on QueryBuilder<Prediction, Prediction, QQueryProperty> {
  QueryBuilder<Prediction, int, QQueryOperations> chatMessageIdProperty() {
    return addPropertyNameInternal('chatMessageId');
  }

  QueryBuilder<Prediction, int, QQueryOperations> createdAtProperty() {
    return addPropertyNameInternal('createdAt');
  }

  QueryBuilder<Prediction, String, QQueryOperations> emotionProperty() {
    return addPropertyNameInternal('emotion');
  }

  QueryBuilder<Prediction, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Prediction, String, QQueryOperations> sentimentProperty() {
    return addPropertyNameInternal('sentiment');
  }
}
