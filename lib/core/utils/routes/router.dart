// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../../../authentication.dart';
import '../../../features/authentication/ui/screens/login_screen.dart';

// Project imports:

class AppRouter {
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const Authentication(),
        routes: [
          GoRoute(
            path: 'login',
            builder: (context, state) => const LoginScreen(),
          )
        ],
      ),
    ],
  );

  GoRouter get router => _router;
}
