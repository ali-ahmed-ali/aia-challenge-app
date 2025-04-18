import 'package:aia_challenge_app/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';

/// Primary button based on [ElevatedButton].
/// Useful for CTAs in the app.
/// @param text - text to display on the button.
/// @param isLoading - if true, a loading indicator will be displayed instead of
/// the text.
/// @param onPressed - callback to be called when the button is pressed.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.text, required this.isLoading, this.onPressed});

  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.p48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary),
        child:
            isLoading
                ? const CircularProgressIndicator()
                : Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
      ),
    );
  }
}
