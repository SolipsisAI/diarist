import 'dart:core';
import 'dart:developer' as logger;
import 'dart:collection';
import 'dart:convert';
import 'dart:isolate';
import 'package:diarist/models/prediction.dart';
import 'package:diarist/utils/isolate_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:bubble/bubble.dart';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';

import 'models/chat_message.dart';
import 'utils.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {Key? key,
      required this.isar,
      required this.chatMessages,
      required this.interpreters,
      required this.vocab,
      required this.isolateUtils})
      : super(key: key);

  final Isar isar;
  final List<ChatMessage> chatMessages;
  final Map<String, int> interpreters;
  final Map<String, dynamic> vocab;
  final IsolateUtils isolateUtils;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _showTyping = false;
  int _page = 0;
  bool _userIsTyping = false;

  List<types.Message> _messages = [];
  final Queue _userMessages = Queue<ChatMessage>();

  final _user = const types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666c');
  final _bot = const types.User(id: '09778d0f-fb94-4ac6-8d72-96112805f3ad');

  late Stream<void> messagesUpdated;

  @override
  void initState() {
    super.initState();

    // Initialize messages
    for (var i = 0; i < widget.chatMessages.length; i++) {
      setState(() {
        _messages.insert(
            0,
            types.TextMessage(
                author: types.User(id: widget.chatMessages[i].userUuid),
                id: widget.chatMessages[i].uuid,
                createdAt: widget.chatMessages[i].createdAt,
                text: widget.chatMessages[i].text));
      });
    }

    initStateAsync();
  }

  void initStateAsync() async {
    messagesUpdated = widget.isar.chatMessages.watchLazy();

    messagesUpdated.listen((event) async {
      if (_userMessages.isNotEmpty) {
        _showTyping = true;

        final ChatMessage lastMessage = _userMessages.last;

        final IsolateData isolateData = IsolateData(
            lastMessage.text,
            lastMessage.id!,
            widget.interpreters['emotion']!,
            widget.interpreters['sentiment']!,
            widget.vocab['emotion'],
            widget.vocab['sentiment']);

        final result = await inference(isolateData);

        _handleBotResponse(result, lastMessage);

        _showTyping = false;
      }
    });
  }

  Future<void> _handleBotResponse(
      Map<String, Object> result, ChatMessage chatMessage) async {
    final String emotionLabel = result['emotion']! as String;
    final String sentimentLabel = result['sentiment']! as String;

    final String responseText =
        'It sounds like you are feeling $emotionLabel and that your general sentiment is $sentimentLabel.';

    final types.TextMessage message = types.TextMessage(
        id: randomString(),
        author: _bot,
        text: responseText,
        createdAt: currentTimestamp());

    setState(() {
      _addMessage(message);
      _addPrediction(result, chatMessage);
      _userMessages.removeFirst();
    });
  }

  void _addPrediction(
      Map<String, Object> result, ChatMessage chatMessage) async {
    final String emotionLabel = result['emotion'] as String;
    final String sentimentLabel = result['sentiment'] as String;
    final double emotionScore = result['emotionScore'] as double;
    final double sentimentScore = result['sentimentScore'] as double;

    final newPrediction = Prediction()
      ..chatMessage.value = chatMessage
      ..createdAt = currentTimestamp()
      ..emotion = emotionLabel
      ..emotionScore = emotionScore
      ..sentiment = sentimentLabel
      ..sentimentScore = sentimentScore;

    await widget.isar.writeTxn((isar) async {
      await isar.predictions.put(newPrediction);
    });

    logger.log(
        'prediction ${newPrediction.id} (ChatMessage ${newPrediction.chatMessage.value?.id}): emotion: ${newPrediction.emotion} [${newPrediction.emotionScore}], sentiment: ${newPrediction.sentiment} [${newPrediction.sentimentScore}]');
  }

  Future<Map<String, Object>> inference(IsolateData isolateData) async {
    ReceivePort responsePort = ReceivePort();
    widget.isolateUtils.sendPort
        .send(isolateData..responsePort = responsePort.sendPort);
    final result = await responsePort.first;
    return result;
  }

  void _handleUserTyping(String text) {
    if (!_userIsTyping) {
      toggleUserIsTyping();
    }
  }

  void toggleUserIsTyping() {
    setState(() {
      _userIsTyping = !_userIsTyping;
    });
  }

  Future<void> _handleEndReached() async {
    final uri = Uri.parse(
      'https://reqres.in/api/unknown?page=$_page&per_page=20',
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final data = json['data'] as List<dynamic>;
    logger.log('data: $data');
    final messages = data
        .map(
          (e) => types.TextMessage(
            author: _user,
            id: '$e["id"]',
            text: e['name'] as String,
          ),
        )
        .toList();
    logger.log('messages: $messages');
    setState(() {
      _messages = [..._messages, ...messages];
      _page = _page + 1;
    });
  }

  Future<ChatMessage> _addMessage(types.TextMessage message) async {
    final newMessage = ChatMessage()
      ..createdAt = message.createdAt!
      ..userUuid = message.author.id
      ..uuid = message.id
      ..text = message.text;

    await widget.isar.writeTxn((isar) async {
      await isar.chatMessages.put(newMessage);
    });

    setState(() {
      _messages.insert(0, message);
    });
    logger.log('data: $message');

    return newMessage;
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: currentTimestamp(),
      id: randomString(),
      text: message.text,
    );

    final newMessage = await _addMessage(textMessage);

    setState(() {
      _userMessages.add(newMessage);
    });

    toggleUserIsTyping();
  }

  Widget _bubbleBuilder(
    Widget child, {
    required message,
    required nextMessageInGroup,
  }) {
    return Bubble(
      child: child,
      color: _user.id != message.author.id ||
              message.type == types.MessageType.image
          ? const Color(0xfff5f5f7)
          : const Color(0xff6f61e8),
      margin: nextMessageInGroup
          ? const BubbleEdges.symmetric(horizontal: 6)
          : null,
      nip: nextMessageInGroup
          ? BubbleNip.no
          : _user.id != message.author.id
              ? BubbleNip.leftBottom
              : BubbleNip.rightBottom,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Chat(
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: _user,
          bubbleBuilder: _bubbleBuilder,
          onEndReached: _handleEndReached,
          showTyping: _showTyping,
          showUserAvatars: true,
          showUserNames: true,
          onTextChanged: _handleUserTyping,
        ),
      ),
    );
  }
}
