import 'package:injectable/injectable.dart';
import 'package:ros_flutter/presentation/pages/param_page.dart';
import 'package:go_router/go_router.dart';
@singleton
class AppRouter {
  final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>const ParamPage(title: "Param Page",),
      )
    ]
  );

  GoRouter get router => _router;
}
