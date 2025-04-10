import 'package:aia_challenge_app/src/features/chat/app/ai_service.dart';
import 'package:aia_challenge_app/src/features/chat/app/stt_service.dart';
import 'package:aia_challenge_app/src/features/chat/app/tts_service.dart';
import 'package:aia_challenge_app/src/features/chat/models/app_message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatViewModel extends StateNotifier<List<AppMessage>> {
  ChatViewModel(this._ref)
      : _sttService = STTService(_ref),
        _aiService = AIService(_ref),
        super([]) {
    _aiService.init();
  }

  final Ref _ref;
  final STTService _sttService;
  final TTSService _ttsService = TTSService();
  final AIService _aiService;

  bool isListening = false;

  Future<void> toggleListening() async {
    if (isListening) {
      _sttService.stop();
      isListening = false;
      _ref.read(isListeningProvider.notifier).state = false;
    } else {
      final ready = await _sttService.init();
      if (ready) {
        isListening = true;
        _ref.read(isListeningProvider.notifier).state = true;
        await _sttService.listen(_handleSpeechResult);
      }
    }
  }

  Future<void> _handleSpeechResult(String result) async {
    _sttService.stop();
    isListening = false;
    _ref.read(isListeningProvider.notifier).state = false;

    state = [...state, AppMessage(content: result, sender: Sender.user)];

    final reply = await _aiService.aiFunctionCalling(state);
    state = [...state, AppMessage(content: reply, sender: Sender.bot)];

    await _ttsService.speak(reply ?? '');
  }

  Future<void> sendText(String input) async {
    state = [...state, AppMessage(content: input, sender: Sender.user)];
    final reply = await _aiService.aiFunctionCalling(state);
    state = [...state, AppMessage(content: reply, sender: Sender.bot)];
    await _ttsService.speak(reply ?? '');
  }
}

final chatViewModelProvider = StateNotifierProvider<ChatViewModel, List<AppMessage>>(
  (ref) => ChatViewModel(ref),
);

final isListeningProvider = StateProvider<bool>((ref) => false);
final sttLevelProvider = StateProvider<double>((ref) => 0.0);
