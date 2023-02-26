import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:text_classifiers/text_classifiers.dart';

import 'chat_screen.dart';
import 'models/chat_message.dart';
import 'models/chat_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
  Isolate.spawn(isolateMain, rootIsolateToken);

  final dir = await getApplicationSupportDirectory();
  final Isar _isar = await Isar.open(
      schemas: [ChatMessageSchema, ChatUserSchema], directory: dir.path);
  final chatMessages = await _isar.chatMessages.where().findAll();

  runApp(Diarist(isar: _isar, chatMessages: chatMessages));
}

void isolateMain(RootIsolateToken rootIsolateToken) async {
  BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);
  // const BasicMessageChannel channel =
  //     BasicMessageChannel('ai.solipsis.Diarist', StandardMessageCodec());
  // // Load models
  // final emotionClassifier = EmotionClassifier();
  // final sentimentClassifier = SentimentClassifier();
  // print('emotion: ${emotionClassifier.interpreter.address}');
  // print('sentiment: ${sentimentClassifier.interpreter.address}');
  // final String result =
  //     await channel.send(emotionClassifier.interpreterAddress);
  // print(result);
}

class Diarist extends StatelessWidget {
  const Diarist({Key? key, required this.isar, required this.chatMessages})
      : super(key: key);

  final Isar isar;
  final List<ChatMessage> chatMessages;

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
          home: ChatScreen(isar: isar, chatMessages: chatMessages),
        ));
  }
}
