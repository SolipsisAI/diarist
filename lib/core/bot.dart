import 'package:text_classifiers/text_classifiers.dart';

import 'response.dart';

class ChatBot {
  late int emotionAddress;
  late int sentimentAddress;

  late EmotionClassifier emotionClassifier;
  late SentimentClassifier sentimentClassifier;

  ChatBot({this.emotionAddress = -1, this.sentimentAddress = -1}) {
    // Initialize classifiers
    emotionClassifier = EmotionClassifier(interpreterAddress: emotionAddress);
    emotionAddress = emotionClassifier.address;
    sentimentClassifier =
        SentimentClassifier(interpreterAddress: sentimentAddress);
    sentimentAddress = sentimentClassifier.address;
  }

  Future<ChatResponse> handleMessage(String rawText) async {
    final emotion = await emotionClassifier.classify(rawText);
    final sentiment = await sentimentClassifier.classify(rawText);
    String sentimentLabel = sentiment == 0 ? "NEGATIVE" : "POSITIVE";

    String text = 'Your emotion is $emotion. Your sentiment is $sentimentLabel';

    return ChatResponse(text, emotion, sentiment);
  }
}
