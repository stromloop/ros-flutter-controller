import 'package:flutter/material.dart';
import 'config/injection/injection.dart';
import 'config/router/app_router.dart';
import 'utils/constants/app_constants.dart';
void main() {
  configureDependencies();
  runApp(const MyApp());
}

final _router = locator<AppRouter>().router;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appTitle,
      // add theme file
      // theme: AppTheme.light,
      // darkTheme: AppTheme.dark,
      routerConfig: _router,
      
    );
  }
}
