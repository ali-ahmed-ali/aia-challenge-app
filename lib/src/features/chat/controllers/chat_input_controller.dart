import 'package:flutter/material.dart';

class ChatInputController {
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  void dispose() {
    textController.dispose();
    focusNode.dispose();
  }

  void clear() => textController.clear();
}
