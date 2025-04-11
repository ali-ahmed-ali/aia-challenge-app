import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import '../views/chat_view_model.dart';

class STTService {
  STTService(this.ref);

  final Ref ref;
  final SpeechToText _speech = SpeechToText();

  bool get isListening => _speech.isListening;

  bool _hasInitialized = false;

  Future<bool> init() async {
    if (_hasInitialized) return true;

    final hasSpeech = await _speech.initialize(
      debugLogging: false,
      onStatus: (status) => log("STT Status: $status"),
      onError: (error) => log("STT Error: $error"),
    );

    _hasInitialized = hasSpeech;
    return hasSpeech;
  }

  Future<void> listen(Function(String) onResult) async {
    if (!await init()) return;

    await _speech.listen(
      onResult: (SpeechRecognitionResult result) {
        if (result.finalResult) {
          onResult(result.recognizedWords);
        }
      },
      listenFor: const Duration(seconds: 30),
      pauseFor: const Duration(seconds: 3),
      localeId: 'en_US',
      onSoundLevelChange: (level) {
        ref.read(sttLevelProvider.notifier).state = level;
      },
      listenOptions: SpeechListenOptions(
        partialResults: true,
        cancelOnError: true,
        enableHapticFeedback: true,
        autoPunctuation: true,
        listenMode: ListenMode.confirmation, // or dictation if you prefer
      ),
    );
  }

  void stop() => _speech.stop();
  void cancel() => _speech.cancel();
}
