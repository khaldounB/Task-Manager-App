// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:


class AppRouter {
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[

    ],
  );

  GoRouter get router => _router;
}
