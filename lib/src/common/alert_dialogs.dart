// import 'package:agco/src/constants/app_strings.dart';
import 'package:aia_challenge_app/src/constants/app_strings.dart';
import 'package:flutter/material.dart';

/// Generic function to show a platform-aware Material or Cupertino dialog
Future<bool?> showAlertDialog({
  required BuildContext context,
  required String title,
  String? content,
  String? cancelActionText,
  String defaultActionText = AppStrings.ok,
}) async {
  return showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text(title),
          content: content != null ? Text(content) : null,
          actions: <Widget>[
            if (cancelActionText != null)
              TextButton(child: Text(cancelActionText), onPressed: () => Navigator.of(context).pop(false)),
            TextButton(child: Text(defaultActionText), onPressed: () => Navigator.of(context).pop(true)),
          ],
        ),
  );
}

Future<void> showExceptionAlertDialog({
  required BuildContext context,
  required String title,
  // ignore: inference_failure_on_untyped_parameter
  required exception,
}) => showAlertDialog(
  context: context,
  title: title,
  content: exception.toString(),
  defaultActionText: AppStrings.ok,
);
