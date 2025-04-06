import 'package:aia_challenge_app/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomWrap extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;
  final WrapCrossAlignment? wrapCrossAlignment;
  final WrapAlignment? alignment;
  final WrapAlignment? runAlignment;
  final Axis direction;
  const CustomWrap({
    super.key,
    required this.children,
    this.wrapCrossAlignment,
    this.alignment,
    this.runAlignment,
    this.spacing = PaddingSizes.defaultSize,
    this.runSpacing = PaddingSizes.defaultSize,
    this.direction = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: wrapCrossAlignment ?? WrapCrossAlignment.center,
      alignment: alignment ?? WrapAlignment.center,
      runAlignment: runAlignment ?? WrapAlignment.center,
      spacing: spacing,
      runSpacing: runSpacing,
      direction: direction,
      children: children,
    );
  }

  static spaceEvenly({required List<Widget> children}) {
    return CustomWrap(
      alignment: WrapAlignment.spaceEvenly,
      runAlignment: WrapAlignment.spaceEvenly,
      spacing: PaddingSizes.small,
      runSpacing: PaddingSizes.small,
      children: children,
    );
  }

  static spaceBetween({required List<Widget> children}) {
    return CustomWrap(
      alignment: WrapAlignment.spaceBetween,
      runAlignment: WrapAlignment.center,
      wrapCrossAlignment: WrapCrossAlignment.center,
      spacing: PaddingSizes.defaultSize,
      runSpacing: PaddingSizes.defaultSize,
      children: children,
    );
  }

  static spaceAround({required List<Widget> children}) {
    return CustomWrap(
      alignment: WrapAlignment.spaceAround,
      runAlignment: WrapAlignment.center,
      wrapCrossAlignment: WrapCrossAlignment.center,
      direction: Axis.horizontal,
      spacing: PaddingSizes.small,
      runSpacing: PaddingSizes.small,
      children: children,
    );
  }

  static start({required List<Widget> children}) {
    return CustomWrap(
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      wrapCrossAlignment: WrapCrossAlignment.center,
      spacing: PaddingSizes.defaultSize,
      runSpacing: PaddingSizes.defaultSize,
      children: children,
    );
  }

  static end({required List<Widget> children}) {
    return CustomWrap(
      alignment: WrapAlignment.end,
      runAlignment: WrapAlignment.end,
      wrapCrossAlignment: WrapCrossAlignment.end,
      spacing: PaddingSizes.defaultSize,
      runSpacing: PaddingSizes.defaultSize,
      direction: Axis.vertical,
      children: children,
    );
  }

  static startXSmall({required List<Widget> children}) {
    return CustomWrap(
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.center,
      wrapCrossAlignment: WrapCrossAlignment.center,
      spacing: PaddingSizes.xSmall,
      runSpacing: PaddingSizes.xSmall,
      children: children,
    );
  }

  static Widget spaceAroundWithDynamicSpacing(
      {required BuildContext context, required List<Widget> children}) {
    final bool isLargeScreen = MediaQuery.of(context).size.width > 1400;
    final double spacing = isLargeScreen ? PaddingSizes.xLarge : PaddingSizes.xSmall;
    final double runSpacing = isLargeScreen ? PaddingSizes.xLarge : PaddingSizes.xSmall;
    return CustomWrap(
      alignment: WrapAlignment.spaceAround,
      spacing: spacing,
      runSpacing: runSpacing,
      children: children,
    );
  }
}
