import 'package:flutter/material.dart';

class VoiceButton extends StatelessWidget {
  final bool isListening;
  final VoidCallback onPressed;

  const VoiceButton({super.key, required this.isListening, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: isListening ? Colors.red : Theme.of(context).colorScheme.primary,
      child: Icon(isListening ? Icons.stop : Icons.mic),
    );
  }
}
