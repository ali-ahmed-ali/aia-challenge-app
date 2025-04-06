import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.labelText,
    required this.onPressed,
    super.key,
    this.icon,
    this.backgroundColor,
    this.borderRadius = 10.0,
    this.elevation,
    this.paddingVertical = 10.0,
    this.paddingHorizontal = 10.0,
    this.isLoading = false,
    this.textColor,
    this.tooltip = '',
  });
  final String labelText;
  final VoidCallback onPressed;
  final ImageIcon? icon;

  final Color? backgroundColor;
  final double borderRadius;
  final double? elevation;
  final double paddingVertical;
  final double paddingHorizontal;
  final bool isLoading;
  final Color? textColor;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: icon == null
          ? ElevatedButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(vertical: paddingVertical, horizontal: paddingHorizontal)),
                shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius))),
                elevation: WidgetStateProperty.all(elevation),
                backgroundColor: WidgetStateProperty.all(backgroundColor),
              ),
              onPressed: onPressed,
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Text(
                      labelText,
                      style: TextStyle(color: textColor),
                    ),
            )
          : ElevatedButton.icon(
              style: ButtonStyle(
                padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(vertical: paddingVertical, horizontal: paddingHorizontal)),
                shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius))),
                elevation: WidgetStateProperty.all(elevation),
                backgroundColor: WidgetStateProperty.all(backgroundColor),
              ),
              onPressed: onPressed,
              icon: icon!,
              label: Text(
                labelText,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: textColor),
              ),
            ),
    );
  }
}
