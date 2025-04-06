import 'package:aia_challenge_app/src/features/home/views/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { home }

extension AppPageExtension on AppRoute {
  String get toName {
    switch (this) {
      case AppRoute.home:
        return 'home';
    }
  }

  String get toPath {
    switch (this) {
      case AppRoute.home:
        return '/';
    }
  }
}

final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      return '/';
    },
    routes: [
      GoRoute(
        name: AppRoute.home.name,
        path: AppRoute.home.toPath,
        builder: (context, state) {
          return const HomePage();
        },
      ),
    ],
    // errorBuilder: (context, state) => const NotFoundScreen(),
  );
});
