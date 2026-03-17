import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/routing/route_generator.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
