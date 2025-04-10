import 'package:flutter/material.dart';

class ChatScrollController {
  final ScrollController scrollController = ScrollController();

  void scrollToBottomSmoothly() {
    if (!scrollController.hasClients) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void dispose() => scrollController.dispose();
}
