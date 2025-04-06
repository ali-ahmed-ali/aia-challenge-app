import 'package:aia_challenge_app/src/constants/app_colors.dart';
import 'package:aia_challenge_app/src/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:loading_overlay/loading_overlay.dart';

class CTALoadingOverlay extends ConsumerWidget {
  const CTALoadingOverlay({required this.isLoading, required this.child, super.key});

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LoadingOverlay(
      isLoading: isLoading,
      color: AppColors.white,
      progressIndicator: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(color: AppColors.kPrimaryColor),
          const Gap(10),
          Text(
            AppStrings.pleaseWait,
            style: const TextStyle(color: AppColors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      child: child,
    );
  }
}
