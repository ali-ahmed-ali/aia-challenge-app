import 'dart:developer';

import 'package:aia_challenge_app/src/features/chat/models/app_message.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AIService {
  AIService(this.ref);

  final Ref ref;

  late Gemini geminiAI;

  Future<Gemini> init() async {
    final giminiApiKey = await getAPIKey();
    geminiAI = Gemini.init(apiKey: giminiApiKey, enableDebugging: kDebugMode ? true : false);

    return geminiAI;
  }

  Future<String> getAPIKey() async {
    await dotenv.load(fileName: ".env");
    String geminiApiKey = dotenv.env['GIMINI_API_KEY'] ?? '';
    return geminiApiKey;
  }

  ///parameter name is require
  Future<String?> aiFunctionCalling(List<AppMessage> prompt) async {
    final List<Content> contents = prompt.map((message) {
      return Content(
        parts: [Part.text(message.content!)],
        role: message.sender == Sender.user ? 'user' : 'model',
      );
    }).toList();
    Candidates? candidates = await Gemini.instance.chat(contents);
    log(candidates!.output!);
    return candidates.output;
  }
}
