// Package imports:
import 'package:go_router/go_router.dart';
import 'package:taskmanager/features/home/ui/screens/add_todo_screen.dart';

// Project imports:
import '../../../authentication.dart';
import '../../../features/authentication/ui/screens/login_screen.dart';
import '../../../features/home/ui/screens/home_screen.dart';

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
          ),
          GoRoute(
              path: 'home',
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                    path: 'add',
                    builder: (context, state) => const AddTodoScreen()),
              ]),
        ],
      ),
    ],
  );

  GoRouter get router => _router;
}
