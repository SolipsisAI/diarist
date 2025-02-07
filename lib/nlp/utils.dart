import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:ml_linalg/linalg.dart';
import 'package:path_provider/path_provider.dart';

Vector softmax(List<double> output) {
  // Compute the softmax
  final vector1 = Vector.fromList(output);
  final expVec = vector1.exp();
  final sum = expVec.toList().reduce((a, b) => a + b);
  final result = expVec.scalarDiv(sum);
  final max = result.max();
  //debugPrint('softmax: $max');
  return result;
}

int argmax(Vector input) {
  double maxVal = input.max();
  var index = 0;
  for (var i = 0; i < input.length; i++) {
    if (input[i] == maxVal) {
      index = i;
      break;
    }
  }
  return index;
}

List<String> splitText(String text, {int? maxLen = 256}) {
  final toks = text.split(' ');

  if (toks.length <= maxLen!) {
    return [text.replaceAll(RegExp('\n'), ' ')];
  }

  print('splitText');

  LineSplitter splitter = const LineSplitter();
  return splitter.convert(text);
}

String sanitizeString(String text, bool stripPunctuation) {
  String sanitized = text.toLowerCase();
  if (stripPunctuation) {
    return sanitized.replaceAll(RegExp("[^A-Za-z0-9']"), '');
  }
  return sanitized;
}

Future<String> getModelsDir() async {
  String appdirpath = (await getApplicationSupportDirectory()).path;
  return '$appdirpath/models';
}
