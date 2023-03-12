import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:ml_linalg/linalg.dart';

import 'utils.dart';

const int _sentenceLen = 512;
const String start = '[CLS]';
const String pad = '[PAD]';
const String unk = '[UNK]';
const String sep = '[SEP]';

final List<String> labels = [
  "sadness",
  "joy",
  "love",
  "anger",
  "fear",
  "surprise"
];

Future<Map<String, Object>> classify(
    Interpreter interpreter, String rawText, Map<String, int> dict) async {
  // Split by newline
  List<String> texts = splitText(rawText, maxLen: _sentenceLen);
  debugPrint('texts: $texts');

  if (texts.length == 1) {
    return _classify(interpreter, rawText, dict);
  }

  // Keep track of counts
  var labelIndexes = List<int>.filled(6, 0);
  var scores = List.generate(
      labels.length, (i) => List<double>.filled(texts.length, 0),
      growable: false);

  for (var i = 0; i < texts.length; i++) {
    final result = await _classify(interpreter, texts[i], dict);
    final labelIndex = result['labelIndex'] as int;
    final score = result['score'] as double;
    labelIndexes[labelIndex] += 1;
    scores[labelIndex][i] = score;
  }

  debugPrint('labelIndexes: $labelIndexes');

  var labelIndexesVector = Vector.fromList(labelIndexes);
  final mostFreqLabelIndex = argmax(labelIndexesVector);
  final avgScore =
      Vector.fromList(scores[mostFreqLabelIndex].where((e) => e > 0).toList())
          .mean();

  String label = "neutral";

  if (avgScore > 0.5) {
    label = labels[mostFreqLabelIndex];
  }

  return {'labelIndex': mostFreqLabelIndex, 'label': label, 'score': avgScore};
}

Future<Map<String, Object>> _classify(
    Interpreter interpreter, String text, Map<String, int> dict) async {
  // tokenizeInputText returns List<List<double>>
  // of shape [1, 256].
  List<List<int>> input = tokenizeInputText(text, dict);

  // output of shape [1,6]
  // example: [[-1.434808373451233, -0.602688729763031, 4.8783135414123535, -1.720102071762085, -0.9065110087394714, -1.056220293045044]]
  var output = List<double>.filled(6, 0).reshape([1, 6]);

  // The run method will run inference and
  // store the resulting values in output.
  interpreter.run(input, output);

  // Compute the softmax
  final Vector result = softmax(output[0]);

  // Get label
  final int labelIndex = argmax(result);

  return {
    'labelIndex': labelIndex,
    'label': labels[labelIndex],
    'score': result.max()
  };
}

List<List<int>> tokenizeInputText(String text, Map<String, int> dict) {
  // Whitespace tokenization
  final toks = text.split(' ');

  // Create a list of length==_sentenceLen filled with the value <pad>
  var vec = List<int>.filled(_sentenceLen, dict[pad]!);

  var index = 0;
  if (dict.containsKey(start)) {
    vec[index++] = dict[start]!;
  }

  // For each word in sentence find corresponding index in dict
  for (var tok in toks) {
    if (index > _sentenceLen) {
      break;
    }
    var encoded = wordPiece(sanitizeString(tok, false), dict);
    for (var word in encoded) {
      var sanitizedWord = sanitizeString(word, false);
      vec[index++] =
          dict.containsKey(sanitizedWord) ? dict[sanitizedWord]! : dict[unk]!;
    }
  }

  // EOS
  vec[index++] = dict[sep]!;

  // returning List<List<double>> as our interpreter input tensor expects the shape, [1,256]
  return [vec];
}

List wordPiece(String input, Map<String, int> dict) {
  // Based on https://huggingface.co/course/chapter6/6?fw=pt#tokenization-algorithm
  var word = input.toLowerCase();
  var tokens = [];

  while (word.isNotEmpty) {
    var i = word.length;
    while (i > 0 && !dict.containsKey(word.substring(0, i))) {
      i -= 1;
    }
    if (i == 0) return ["[UNK]"];
    tokens.add(word.substring(0, i));
    word = word.substring(i, word.length);
    if (word.isNotEmpty) word = '##$word';
  }

  return tokens;
}
