import 'package:aia_challenge_app/src/features/chat/views/chat_page.dart';
import 'package:aia_challenge_app/src/features/home/views/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { home, chat }

extension AppPageExtension on AppRoute {
  String get toName {
    switch (this) {
      case AppRoute.home:
        return 'home';
      case AppRoute.chat:
        return 'chat';
    }
  }

  String get toPath {
    switch (this) {
      case AppRoute.home:
        return '/';
      case AppRoute.chat:
        return '/chat';
    }
  }
}

final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      return null;
    },
    routes: [
      GoRoute(
        name: AppRoute.home.name,
        path: AppRoute.home.toPath,
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        name: AppRoute.chat.name,
        path: AppRoute.chat.toPath,
        builder: (context, state) {
          return const ChatPage();
        },
      ),
    ],
    // errorBuilder: (context, state) => const NotFoundScreen(),
  );
});
