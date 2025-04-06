import 'package:aia_challenge_app/src/common/alert_dialogs.dart';
import 'package:aia_challenge_app/src/constants/app_strings.dart';
import 'package:aia_challenge_app/src/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

extension AsyncValueUI on AsyncValue<Result?> {
  void showStatusDialog(BuildContext context) {
    if (!isRefreshing) {
      if (value is Success) {
        final success = value as Success;
        showAlertDialog(context: context, title: success.title, content: success.content);
      } else if (value is Failure) {
        final failure = value as Failure;
        showExceptionAlertDialog(context: context, title: AppStrings.errorOccurred, exception: failure.error);
      }
    }
  }
}
