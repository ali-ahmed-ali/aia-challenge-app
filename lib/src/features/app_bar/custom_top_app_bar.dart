import 'package:aia_challenge_app/src/constants/assets_icons.dart';
import 'package:aia_challenge_app/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTopAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final bool centerTitle;

  final void Function()? onPressed;

  final String title;
  const CustomTopAppBar({
    super.key,
    this.title = '',
    this.onPressed,
    this.showBackButton = false,
    this.centerTitle = true,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(
        title,
        style:
            centerTitle
                ? const TextStyle(fontSize: 20)
                : const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: centerTitle,
      scrolledUnderElevation: 0,
      leading:
          showBackButton
              ? IconButton(
                icon: const Icon(AssetsIcons.arrowLeftIcon),
                onPressed:
                    onPressed ??
                    () {
                      ref.watch(goRouterProvider).pop();
                    },
              )
              : null,
    );
  }
}
