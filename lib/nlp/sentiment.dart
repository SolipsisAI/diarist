import 'package:flutter/foundation.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:ml_linalg/linalg.dart';

import 'utils.dart';

const int sentenceLen = 256;
const String start = '<START>';
const String pad = '<PAD>';
const String unk = '<UNKNOWN>';

Future<String> classify(
    Interpreter interpreter, String rawText, Map<String, int> dict) async {
  // tokenizeInputText returns List<List<double>>
  // of shape [1, 256].
  List<List<double>> input = tokenizeInputText(rawText, dict);

  // output of shape [1,2].
  var output = List<double>.filled(2, 0).reshape([1, 2]);

  // The run method will run inference and
  // store the resulting values in output.
  interpreter.run(input, output);

  var result = "POSITIVE";

  // If value of first element in output is greater than second,
  // then the sentence is negative
  if ((output[0][0] as double) > (output[0][1] as double)) {
    result = "NEGATIVE";
  }

  return result;
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
    if (index > sentenceLen) {
      break;
    }
    vec[index++] =
        dict.containsKey(tok) ? dict[tok]!.toDouble() : dict[unk]!.toDouble();
  }

  // returning List<List<double>> as our interpreter input tensor expects the shape, [1,256]
  return [vec];
}
