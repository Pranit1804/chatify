import 'package:chatify/local_database/user_store.dart';
import 'package:chatify/modules/chat/data/models/chat_model.dart';
import 'package:chatify/modules/chat/presentation/widgets/green_message_bubble.dart';
import 'package:chatify/modules/chat/presentation/widgets/white_message_bubble.dart';
import 'package:flutter/material.dart';

class ChatsBubble extends StatelessWidget {
  final ChatModel chat;
  const ChatsBubble({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return UserStore.getUserId()! == chat.senderId
        ? GreenMessageBubble(chat)
        : WhiteMessageBubble(chat);
  }
}
