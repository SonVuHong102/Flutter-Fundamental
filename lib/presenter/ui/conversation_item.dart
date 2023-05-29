import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class ConversationItem extends StatelessWidget {
  const ConversationItem(
      {Key? key,
      required this.image,
      required this.name,
      required this.lastMessage,
      required this.lastSend,
      required this.sendStatus,
      required this.timeSent})
      : super(key: key);
  final Image image;
  final String name;
  final String lastMessage;
  final String timeSent;
  final bool lastSend;
  final SendStatus sendStatus;

  @override
  Widget build(BuildContext context) {
    final lastMessageText = '${lastSend ? 'You: ' : ''}$lastMessage · $timeSent';
    Widget messageStatus = Assets.image.sending.image();
    switch (sendStatus) {
      case SendStatus.sending:
        messageStatus = Assets.image.sending.image();
        break;
      case SendStatus.sent:
        messageStatus = Assets.image.sent.image();
        break;
      case SendStatus.none:
        messageStatus = const SizedBox(width: 16);
        break;
    }
    return ListTile(
      leading: image,
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        lastMessageText,
        style: const TextStyle(fontSize: 14),
      ),
      trailing: messageStatus,
    );
  }
}

enum SendStatus { sending, sent, none }
