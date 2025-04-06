import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dark_mode_toggle_provider.g.dart';

@riverpod
class DarkModeToggleNotifier extends _$DarkModeToggleNotifier {
  @override
  bool build() => false;

  @override
  set state(bool newState) => super.state = newState;
}

