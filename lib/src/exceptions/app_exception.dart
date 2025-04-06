import 'package:aia_challenge_app/src/utils/async_value_ui.dart';
import 'package:aia_challenge_app/src/utils/result.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

enum ErrorSeverity { low, medium, high, severe, fatal }

sealed class AppException implements Exception {
  AppException(this.code, this.message, this.severity, {this.e});
  final String code;
  final String message;
  final Exception? e;
  final ErrorSeverity severity;

  @override
  String toString() => message;

  static void handleAppErrors(BuildContext context, AsyncValue<Result?> state) async {
    state.showStatusDialog(context);
  }
}
