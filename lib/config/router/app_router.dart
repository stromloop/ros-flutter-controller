import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:ros_flutter/presentation/pages/config_page.dart';
import 'package:ros_flutter/presentation/pages/param_page.dart';
import 'package:go_router/go_router.dart';
import 'package:ros_flutter/utils/constants/route_name.dart';
@singleton
class AppRouter {
  final GoRouter _router = GoRouter(
    navigatorKey: Get.key,
    debugLogDiagnostics: true,
    initialLocation: RoutePath.home,
    routes: [
      GoRoute(
        path: RoutePath.home,
        builder: (context, state) =>const ParamPage(title: "Param Page",),
      ),
       GoRoute(
        path: RoutePath.config,
        builder: (context, state) => ConfigPage(),
      )
    ]
  );

  GoRouter get router => _router;
}
