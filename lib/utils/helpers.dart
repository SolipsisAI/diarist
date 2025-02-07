import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

String getEnv() {
  const env = String.fromEnvironment("APP_CONFIG_ENV", defaultValue: "dev");

  if (env.isEmpty) {
    return ".dev";
  }

  return env == 'prod' ? '' : '.$env';
}

String randomString() {
  const uuid = Uuid();
  return uuid.v4();
}

int currentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch;
}

DateTime currentDateTime() {
  return DateTime.now();
}

DateTime toDateTime(String datestring) {
  return DateTime.parse(datestring);
}

String toDateString(DateTime datetime) {
  final _datetime = (datetime.toLocal());
  return DateFormat.yMMMEd('en_US').add_jm().format(_datetime);
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

String getExcerpt(String text, int maxLength) {
  if (text.isEmpty) return "";

  const splitter = LineSplitter();
  final textLines = splitter.convert(text);
  final firstLine = textLines[0];

  final bool needsEllipsis = firstLine.length >= maxLength;
  final int end = needsEllipsis ? maxLength : firstLine.length;
  final String trailing = needsEllipsis ? '...' : '';

  return '${firstLine.substring(0, end)}$trailing';
}

Future<Directory> getAppDocDir() async {
  final dir = await getApplicationDocumentsDirectory();
  final appDocDir =
      await Directory('${dir.path}/Diarist${getEnv()}').create(recursive: true);

  return appDocDir;
}

Future<Directory> getAppSupportDir() async {
  final dir = await getApplicationSupportDirectory();
  final appDocDir =
      await Directory('${dir.path}/Diarist${getEnv()}').create(recursive: true);

  return appDocDir;
}
