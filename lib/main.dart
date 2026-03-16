import 'package:flutter/material.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/routing/route_generator.dart';
import 'package:news_app/core/theme/app_theme.dart';

void main() {
  runApp(const NwesApp());
}

class NwesApp extends StatelessWidget {
  const NwesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:RouteGenerator.onGenerateRoute,
      theme: AppTheme.mainTheme,
      initialRoute: AppRoutes.splashView,
    );
  }
}
