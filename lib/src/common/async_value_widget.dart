import 'package:aia_challenge_app/src/common/error_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({required this.value, required this.data, super.key});
  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, st) {
        return Center(child: ErrorMessageWidget('AsyncValueWidgetError value:$value: e:$e'));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
