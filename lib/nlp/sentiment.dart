import 'package:flutter/foundation.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:ml_linalg/linalg.dart';

import 'utils.dart';

const int sentenceLen = 512;
const String start = '<START>';
const String pad = '<PAD>';
const String unk = '<UNKNOWN>';

final List<String> labels = ['NEGATIVE', 'POSITIVE'];

Future<Map<String, Object>> classify(
    Interpreter interpreter, String rawText, Map<String, int> dict,
    {bool split = false}) async {
  if (!split) {
    return classifyNoSplit(interpreter, rawText, dict);
  }

  List<String> texts = splitText(rawText);

  var labelIndexes = List<int>.filled(labels.length, 0);
  var scores = List.generate(
      labels.length, (i) => List<double>.filled(texts.length, 0),
      growable: false);

  for (var i = 0; i < texts.length; i++) {
    // tokenizeInputText returns List<List<double>>
    // of shape [1, 256].
    List<List<double>> input = tokenizeInputText(rawText, dict);

    // output of shape [1,2].
    var output =
        List<double>.filled(labels.length, 0).reshape([1, labels.length]);

    // The run method will run inference and
    // store the resulting values in output.
    interpreter.run(input, output);

    // If value of first element in output is greater than second,
    // then the sentence is negative
    var labelIndex = 1;
    if ((output[0][0] as double) > (output[0][1] as double)) {
      labelIndex = 0;
    }

    labelIndexes[labelIndex] += 1;

    scores[labelIndex][i] = output[0][labelIndex] as double;
  }

  var labelIndexesVector = Vector.fromList(labelIndexes);
  final mostFreqLabelIndex = argmax(labelIndexesVector);
  final avgScore =
      Vector.fromList(scores[mostFreqLabelIndex].where((e) => e > 0).toList())
          .mean();

  return {'label': labels[mostFreqLabelIndex], 'score': avgScore};
}

Future<Map<String, Object>> classifyNoSplit(
    Interpreter interpreter, String rawText, Map<String, int> dict) async {
  // tokenizeInputText returns List<List<double>>
  // of shape [1, 256].
  List<List<double>> input = tokenizeInputText(rawText, dict);

  // output of shape [1,2].
  var output =
      List<double>.filled(labels.length, 0).reshape([1, labels.length]);

  // The run method will run inference and
  // store the resulting values in output.
  interpreter.run(input, output);

  var labelIndex = 1;
  // If value of first element in output is greater than second,
  // then the sentence is negative
  if ((output[0][0] as double) > (output[0][1] as double)) {
    labelIndex = 0;
  }

  return {
    'label': labels[labelIndex],
    'score': output[0][labelIndex] as double
  };
}

List<List<double>> tokenizeInputText(String text, Map<String, int> dict) {
  // Whitespace tokenization
  final toks = text.split(' ');

  // Create a list of length==_sentenceLen filled with the value <pad>
  var vec = List<double>.filled(sentenceLen, dict[pad]!.toDouble());

  var index = 0;
  if (dict.containsKey(start)) {
    vec[index++] = dict[start]!.toDouble();
  }

  // For each word in sentence find corresponding index in dict
  for (var tok in toks) {
    if (index >= sentenceLen) {
      break;
    }
    var sanitizedWord = sanitizeString(tok, true);
    vec[index++] = dict.containsKey(sanitizedWord)
        ? dict[sanitizedWord]!.toDouble()
        : dict[unk]!.toDouble();
  }

  // returning List<List<double>> as our interpreter input tensor expects the shape, [1,256]
  return [vec];
}
