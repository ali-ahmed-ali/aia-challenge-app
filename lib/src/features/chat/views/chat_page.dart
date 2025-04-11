import 'package:aia_challenge_app/src/common/chat_bubble.dart';
import 'package:aia_challenge_app/src/features/chat/controllers/chat_scroll_controller.dart';
import 'package:aia_challenge_app/src/features/chat/models/app_message.dart';
import 'package:aia_challenge_app/src/features/chat/views/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late final ChatScrollController _chatScroll;

  @override
  void initState() {
    super.initState();
    _chatScroll = ChatScrollController();
  }

  @override
  void dispose() {
    _chatScroll.dispose();
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _sendText() async {
    final chatController = ref.read(chatViewModelProvider.notifier);
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    _textController.clear();
    _focusNode.unfocus();

    await chatController.sendText(text); // handles message display + AI + TTS
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(chatViewModelProvider);
    final isListening = ref.watch(isListeningProvider);
    final chatController = ref.read(chatViewModelProvider.notifier);

    ref.listen<List<AppMessage>>(chatViewModelProvider, (previous, next) {
      if (next.length > (previous?.length ?? 0)) {
        _chatScroll.scrollToBottomSmoothly();
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text("AIA Chat")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _chatScroll.scrollController,
              padding: const EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (_, i) => ChatBubble(message: messages[i]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onChanged: (_) => setState(() {}),
                    onSubmitted: (_) => _sendText(),
                  ),
                ),
                const SizedBox(width: 8),
                if (_textController.text.trim().isNotEmpty)
                  Container(
                    decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: _sendText,
                    ),
                  )
                else
                  Container(
                    decoration: BoxDecoration(
                      color: isListening ? Colors.red : Colors.grey.shade800,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(isListening ? Icons.mic_off : Icons.mic, color: Colors.white),
                      onPressed: chatController.toggleListening,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
