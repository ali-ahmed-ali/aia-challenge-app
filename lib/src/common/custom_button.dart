import 'package:aia_challenge_app/src/common/custom_wrap.dart';
import 'package:aia_challenge_app/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, tertiary, error, disabled }

enum ButtonStyleType { filled, outlined, tonal, text }

class CustomButton extends StatelessWidget {
  final ButtonType type;
  final ButtonStyleType styleType;
  final String text;
  final VoidCallback? onPressed;
  final Widget? icon;
  final String? tooltip;
  final double? padding;
  final double? elevation;
  final double? radius;
  const CustomButton({
    super.key,
    required this.type,
    required this.styleType,
    required this.text,
    this.onPressed,
    this.icon,
    this.tooltip,
    this.padding,
    this.elevation,
    this.radius,
  });

  ButtonStyle _getStyle(ButtonType type, ButtonStyleType styleType, ThemeData theme) {
    Color getColor() {
      switch (type) {
        case ButtonType.primary:
          return theme.colorScheme.primary;
        case ButtonType.secondary:
          return theme.colorScheme.secondary;
        case ButtonType.tertiary:
          return theme.colorScheme.tertiary;
        case ButtonType.error:
          return theme.colorScheme.error;
        case ButtonType.disabled:
          return theme.colorScheme.surface.withOpacity(0.38);
      }
    }

    Color getOnColor() {
      switch (type) {
        case ButtonType.primary:
          return theme.colorScheme.onPrimary;
        case ButtonType.secondary:
          return theme.colorScheme.onSecondary;
        case ButtonType.tertiary:
          return theme.colorScheme.onTertiary;
        case ButtonType.error:
          return theme.colorScheme.onError;
        case ButtonType.disabled:
          return theme.colorScheme.onSurface.withOpacity(0.38);
      }
    }

    switch (styleType) {
      case ButtonStyleType.filled:
        return ElevatedButton.styleFrom(
          foregroundColor: getOnColor(),
          backgroundColor: getColor(),
          elevation: elevation,
          shape: radius != null ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!)) : null,
        );

      case ButtonStyleType.outlined:
        return OutlinedButton.styleFrom(
          foregroundColor: getColor(),
          disabledForegroundColor: getOnColor().withOpacity(0.38),
          elevation: elevation,
          shape: radius != null ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!)) : null,
        );
      case ButtonStyleType.text:
        return TextButton.styleFrom(
          foregroundColor: getColor(),
          disabledForegroundColor: getOnColor().withOpacity(0.38),
          elevation: elevation,
          shape: radius != null ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!)) : null,
        );
      case ButtonStyleType.tonal:
        return ElevatedButton.styleFrom(
          foregroundColor: theme.colorScheme.onPrimaryContainer,
          backgroundColor: theme.colorScheme.primaryContainer,
          elevation: elevation,
          shape: radius != null ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!)) : null,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = _getStyle(type, styleType, theme);
    Widget buttonLabel(String label) {
      Color? iconColor;
      if (icon != null) {
        final resolvedColor = style.foregroundColor?.resolve(<WidgetState>{WidgetState.disabled});
        iconColor = onPressed == null ? resolvedColor : null;
      }
      return Container(
        padding: padding != null ? EdgeInsets.all(padding!) : null,
        child: Text(label, style: const TextStyle(fontSize: AppSizes.p14).copyWith(color: iconColor)),
      );
    }

    final buttonChild = buttonLabel(text);
    final button = () {
      switch (styleType) {
        case ButtonStyleType.filled:
          return icon != null
              ? ElevatedButton.icon(style: style, onPressed: onPressed, label: buttonChild, icon: icon!)
              : ElevatedButton(style: style, onPressed: onPressed, child: buttonChild);
        case ButtonStyleType.outlined:
          return icon != null
              ? OutlinedButton.icon(style: style, onPressed: onPressed, label: buttonChild, icon: icon!)
              : OutlinedButton(style: style, onPressed: onPressed, child: buttonChild);
        case ButtonStyleType.tonal:
          return icon != null
              ? ElevatedButton.icon(style: style, onPressed: onPressed, label: buttonChild, icon: icon!)
              : ElevatedButton(style: style, onPressed: onPressed, child: buttonChild);
        case ButtonStyleType.text:
          return icon != null
              ? TextButton.icon(style: style, onPressed: onPressed, label: buttonChild, icon: icon!)
              : TextButton(style: style, onPressed: onPressed, child: buttonChild);
      }
    }();

    // Wrapping the button with a Tooltip
    return tooltip != null ? Tooltip(message: tooltip!, child: button) : button;
  }
}

// Mapping button types to icons for demonstration
final Map<ButtonType, IconData> buttonIcons = {
  ButtonType.primary: Icons.home,
  ButtonType.secondary: Icons.search,
  ButtonType.tertiary: Icons.info,
  ButtonType.error: Icons.error,
  ButtonType.disabled: Icons.block,
};
CustomWrap customButtonExampleButtons() {
  return CustomWrap(
    spacing: PaddingSizes.xSmall, // Horizontal space between buttons
    runSpacing: PaddingSizes.xSmall, // Vertical space between buttons
    children: ButtonType.values.map((type) {
      return Column(
        children: ButtonStyleType.values.map((styleType) {
          return CustomButton(
            type: type,
            styleType: styleType,
            icon: const Icon(Icons.add),
            text: '${type.toString().split('.').last} ${styleType.toString().split('.').last}',
            // tooltip: '${type.toString().split('.').last} ${styleType.toString().split('.').last}',
            onPressed: type == ButtonType.disabled ? null : () {},
          );
        }).toList(),
      );
    }).toList(),
  );
}
