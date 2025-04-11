import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_message.freezed.dart';
part 'app_message.g.dart';

enum Sender { user, bot }

@freezed
abstract class AppMessage with _$AppMessage {
  factory AppMessage({String? content, Sender? sender, DateTime? timestamp}) = _AppMessage;
}

@freezed
sealed class AppMessageState with _$AppMessageState {
  const factory AppMessageState.sent(String content) = Sent;
  const factory AppMessageState.received(String content) = Received;
  const factory AppMessageState.failed([String? errorMessage]) = Failed;
  const factory AppMessageState.read(String content) = Read;

  factory AppMessageState.fromJson(Map<String, Object?> json) => _$AppMessageStateFromJson(json);
}
