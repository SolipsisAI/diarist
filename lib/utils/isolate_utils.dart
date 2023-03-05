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

      final emotionLabel = await emotion.classify(
          emotionInterpreter, isolateData.rawText, isolateData.emotionDict);
      final sentimentLabel = await sentiment.classify(
          sentimentInterpreter, isolateData.rawText, isolateData.sentimentDict);

      isolateData.responsePort.send({
        'chatMessageId': isolateData.chatMessageId,
        'emotion': emotionLabel,
        'sentiment': sentimentLabel
      });
    }
  }
}

/// Bundles data to pass between Isolate
class IsolateData {
  final String rawText;
  late int chatMessageId;
  late int emotionAddress;
  late int sentimentAddress;
  late Map<String, int> emotionDict;
  late Map<String, int> sentimentDict;
  late SendPort responsePort;

  IsolateData(this.rawText, this.chatMessageId, this.emotionAddress,
      this.sentimentAddress, this.emotionDict, this.sentimentDict);
}
