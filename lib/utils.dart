import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

const String loremIpsumApiUrl =
    'https://litipsum.com/api/dr-jekyll-and-mr-hyde/1/json';
const int wordsPerMinute = 100;

String randomString() {
  const uuid = Uuid();
  return uuid.v4();
}

Future<types.TextMessage> randomMessage(types.User user) async {
  final uri = Uri.parse(loremIpsumApiUrl);
  final response = await http.get(uri);
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  final data = json['text'] as List<dynamic>;
  final text = data[0];
  return types.TextMessage(
    author: user,
    createdAt: DateTime.now().millisecondsSinceEpoch,
    id: randomString(),
    text: text,
  );
}

int messageDelay(types.TextMessage message) {
  final List words = message.text.split(" ");
  final int wordCount = words.length;
  return (wordCount ~/ wordsPerMinute) * 60;
}

int currentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch;
}

Future<Map<String, int>> loadVocab(String vocabFile) async {
  final vocab = await rootBundle.loadString('assets/models/$vocabFile');

  var tempDict = <String, int>{};

  final vocabList = vocab.split('\n');

  for (var i = 0; i < vocabList.length; i++) {
    var entry = vocabList[i].trim().split(' ');
    tempDict[entry[0]] = int.parse(entry[1]);
  }

  return tempDict;
}
