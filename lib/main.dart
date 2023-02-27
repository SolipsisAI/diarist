import 'package:diarist/core/bot.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:text_classifiers/text_classifiers.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import 'chat_screen.dart';
import 'models/chat_message.dart';
import 'models/chat_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationSupportDirectory();
  final Isar _isar = await Isar.open(
      schemas: [ChatMessageSchema, ChatUserSchema], directory: dir.path);
  final chatMessages = await _isar.chatMessages.where().findAll();

  // Load interpreters
  final Interpreter emotionInterpreter =
      await Interpreter.fromAsset('models/emotion_classification.tflite');
  final Interpreter sentimentInterpreter =
      await Interpreter.fromAsset('models/sentiment_classification.tflite');
  final Map<String, int> classifiers = {
    'emotion': emotionInterpreter.address,
    'sentiment': sentimentInterpreter.address
  };

  runApp(Diarist(
    isar: _isar,
    chatMessages: chatMessages,
    classifiers: classifiers,
  ));
}

class Diarist extends StatelessWidget {
  const Diarist(
      {Key? key,
      required this.isar,
      required this.chatMessages,
      required this.classifiers})
      : super(key: key);

  final Isar isar;
  final List<ChatMessage> chatMessages;
  final Map<String, int> classifiers;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: MaterialApp(
          title: 'Diarist',
          home: ChatScreen(
              isar: isar, chatMessages: chatMessages, classifiers: classifiers),
        ));
  }
}
