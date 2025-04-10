import 'package:aia_challenge_app/src/features/chat/models/app_message.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final AppMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.sender == Sender.user;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser ? Theme.of(context).colorScheme.primary : Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(message.content!, style: TextStyle(color: isUser ? Colors.white : Colors.black)),
      ),
    );
  }
}
