/*
Run inference in an Isolate so the UI isn't blocked
Source: https://github.com/am15h/object_detection_flutter/blob/master/lib/utils/isolate_utils.dart
* */

import 'dart:isolate';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import '../nlp/emotion.dart' as emotion;
import '../nlp/sentiment.dart' as sentiment;

/// Manages separate Isolate instance for inference
class IsolateUtils {
  static const String DEBUG_NAME = "InferenceIsolate";

  late Isolate _isolate;
  late SendPort _sendPort;

  SendPort get sendPort => _sendPort;

  Future<void> start(
      RootIsolateToken rootIsolateToken, ReceivePort rootIsolatePort) async {
    _isolate = await Isolate.spawn<SendPort>(
      entryPoint,
      rootIsolatePort.sendPort,
      debugName: DEBUG_NAME,
    );

    _sendPort = await rootIsolatePort.first;
  }

  static void entryPoint(SendPort sendPort) async {
    final port = ReceivePort();
    sendPort.send(port.sendPort);

    await for (final IsolateData isolateData in port) {
      Interpreter emotionInterpreter =
          Interpreter.fromAddress(isolateData.emotionAddress);
      Interpreter sentimentInterpreter =
          Interpreter.fromAddress(isolateData.sentimentAddress);

      // Emotion
      final emotionResult = await emotion.classify(
          emotionInterpreter, isolateData.text, isolateData.emotionDict);

      // Sentiment
      final sentimentResult = await sentiment.classify(
          sentimentInterpreter, isolateData.text, isolateData.sentimentDict);

      isolateData.responsePort.send({
        'noteId': isolateData.noteUuid,
        'emotion': emotionResult['label']!,
        'emotionScore': emotionResult['score']!,
        'sentiment': sentimentResult['label']!,
        'sentimentScore': sentimentResult['score']!
      });
    }
  }
}

/// Bundles data to pass between Isolate
class IsolateData {
  final String text;
  late String noteUuid;
  late int emotionAddress;
  late int sentimentAddress;
  late Map<String, int> emotionDict;
  late Map<String, int> sentimentDict;
  late SendPort responsePort;

  IsolateData(this.text, this.noteUuid, this.emotionAddress,
      this.sentimentAddress, this.emotionDict, this.sentimentDict);
}
