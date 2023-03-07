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
      '{"name":"Prediction","idName":"id","properties":[{"name":"createdAt","type":"Long"},{"name":"emotion","type":"String"},{"name":"emotionScore","type":"Double"},{"name":"sentiment","type":"String"},{"name":"sentimentScore","type":"Double"}],"indexes":[],"links":[{"name":"chatMessage","target":"ChatMessage"}]}',
  idName: 'id',
  propertyIds: {
    'createdAt': 0,
    'emotion': 1,
    'emotionScore': 2,
    'sentiment': 3,
    'sentimentScore': 4
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'chatMessage': 0},
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
  return [object.chatMessage];
}

void _predictionSerializeNative(
    IsarCollection<Prediction> collection,
    IsarRawObject rawObj,
    Prediction object,
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
}

Prediction _predictionDeserializeNative(IsarCollection<Prediction> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = Prediction();
  object.createdAt = reader.readLong(offsets[0]);
  object.emotion = reader.readString(offsets[1]);
  object.emotionScore = reader.readDouble(offsets[2]);
  object.id = id;
  object.sentiment = reader.readString(offsets[3]);
  object.sentimentScore = reader.readDouble(offsets[4]);
  _predictionAttachLinks(collection, id, object);
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
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _predictionSerializeWeb(
    IsarCollection<Prediction> collection, Prediction object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'createdAt', object.createdAt);
  IsarNative.jsObjectSet(jsObj, 'emotion', object.emotion);
  IsarNative.jsObjectSet(jsObj, 'emotionScore', object.emotionScore);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'sentiment', object.sentiment);
  IsarNative.jsObjectSet(jsObj, 'sentimentScore', object.sentimentScore);
  return jsObj;
}

Prediction _predictionDeserializeWeb(
    IsarCollection<Prediction> collection, dynamic jsObj) {
  final object = Prediction();
  object.createdAt =
      IsarNative.jsObjectGet(jsObj, 'createdAt') ?? double.negativeInfinity;
  object.emotion = IsarNative.jsObjectGet(jsObj, 'emotion') ?? '';
  object.emotionScore =
      IsarNative.jsObjectGet(jsObj, 'emotionScore') ?? double.negativeInfinity;
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.sentiment = IsarNative.jsObjectGet(jsObj, 'sentiment') ?? '';
  object.sentimentScore = IsarNative.jsObjectGet(jsObj, 'sentimentScore') ??
      double.negativeInfinity;
  _predictionAttachLinks(
      collection, IsarNative.jsObjectGet(jsObj, 'id'), object);
  return object;
}

P _predictionDeserializePropWeb<P>(Object jsObj, String propertyName) {
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
    default:
      throw 'Illegal propertyName';
  }
}

void _predictionAttachLinks(IsarCollection col, int id, Prediction object) {
  object.chatMessage.attach(col, col.isar.chatMessages, 'chatMessage', id);
}

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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition>
      emotionScoreGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'emotionScore',
      value: value,
    ));
  }

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition>
      emotionScoreLessThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'emotionScore',
      value: value,
    ));
  }

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition>
      emotionScoreBetween(double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'emotionScore',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
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

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition>
      sentimentScoreGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'sentimentScore',
      value: value,
    ));
  }

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition>
      sentimentScoreLessThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'sentimentScore',
      value: value,
    ));
  }

  QueryBuilder<Prediction, Prediction, QAfterFilterCondition>
      sentimentScoreBetween(double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sentimentScore',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }
}

extension PredictionQueryLinks
    on QueryBuilder<Prediction, Prediction, QFilterCondition> {
  QueryBuilder<Prediction, Prediction, QAfterFilterCondition> chatMessage(
      FilterQuery<ChatMessage> q) {
    return linkInternal(
      isar.chatMessages,
      q,
      'chatMessage',
    );
  }
}

extension PredictionQueryWhereSortBy
    on QueryBuilder<Prediction, Prediction, QSortBy> {
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

  QueryBuilder<Prediction, Prediction, QAfterSortBy> sortByEmotionScore() {
    return addSortByInternal('emotionScore', Sort.asc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> sortByEmotionScoreDesc() {
    return addSortByInternal('emotionScore', Sort.desc);
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

  QueryBuilder<Prediction, Prediction, QAfterSortBy> sortBySentimentScore() {
    return addSortByInternal('sentimentScore', Sort.asc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy>
      sortBySentimentScoreDesc() {
    return addSortByInternal('sentimentScore', Sort.desc);
  }
}

extension PredictionQueryWhereSortThenBy
    on QueryBuilder<Prediction, Prediction, QSortThenBy> {
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

  QueryBuilder<Prediction, Prediction, QAfterSortBy> thenByEmotionScore() {
    return addSortByInternal('emotionScore', Sort.asc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy> thenByEmotionScoreDesc() {
    return addSortByInternal('emotionScore', Sort.desc);
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

  QueryBuilder<Prediction, Prediction, QAfterSortBy> thenBySentimentScore() {
    return addSortByInternal('sentimentScore', Sort.asc);
  }

  QueryBuilder<Prediction, Prediction, QAfterSortBy>
      thenBySentimentScoreDesc() {
    return addSortByInternal('sentimentScore', Sort.desc);
  }
}

extension PredictionQueryWhereDistinct
    on QueryBuilder<Prediction, Prediction, QDistinct> {
  QueryBuilder<Prediction, Prediction, QDistinct> distinctByCreatedAt() {
    return addDistinctByInternal('createdAt');
  }

  QueryBuilder<Prediction, Prediction, QDistinct> distinctByEmotion(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('emotion', caseSensitive: caseSensitive);
  }

  QueryBuilder<Prediction, Prediction, QDistinct> distinctByEmotionScore() {
    return addDistinctByInternal('emotionScore');
  }

  QueryBuilder<Prediction, Prediction, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Prediction, Prediction, QDistinct> distinctBySentiment(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('sentiment', caseSensitive: caseSensitive);
  }

  QueryBuilder<Prediction, Prediction, QDistinct> distinctBySentimentScore() {
    return addDistinctByInternal('sentimentScore');
  }
}

extension PredictionQueryProperty
    on QueryBuilder<Prediction, Prediction, QQueryProperty> {
  QueryBuilder<Prediction, int, QQueryOperations> createdAtProperty() {
    return addPropertyNameInternal('createdAt');
  }

  QueryBuilder<Prediction, String, QQueryOperations> emotionProperty() {
    return addPropertyNameInternal('emotion');
  }

  QueryBuilder<Prediction, double, QQueryOperations> emotionScoreProperty() {
    return addPropertyNameInternal('emotionScore');
  }

  QueryBuilder<Prediction, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Prediction, String, QQueryOperations> sentimentProperty() {
    return addPropertyNameInternal('sentiment');
  }

  QueryBuilder<Prediction, double, QQueryOperations> sentimentScoreProperty() {
    return addPropertyNameInternal('sentimentScore');
  }
}
