import 'package:aia_challenge_app/src/constants/app_colors.dart';
import 'package:aia_challenge_app/src/constants/app_theme.dart';
import 'package:aia_challenge_app/src/features/dark_mode/dark_mode_toggle_provider.dart';
import 'package:aia_challenge_app/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final isDark = ref.watch(darkModeToggleNotifierProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'Flutter Demo',
      color: AppColors.kPrimaryColor,
      debugShowCheckedModeBanner: false,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      theme: getAppTheme(isDark),
      builder: EasyLoading.init(),
    );
  }
}
