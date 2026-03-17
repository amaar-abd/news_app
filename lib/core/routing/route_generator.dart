import 'package:flutter/material.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:news_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:news_app/features/home/presentation/views/home_view.dart';
import 'package:news_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:news_app/features/splash/presentation/views/splash_view.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashView:
        return MaterialPageRoute(builder: (context) =>  SplashView());
      case AppRoutes.onBoardingView:
        return MaterialPageRoute(builder: (context) =>  OnBoardingView());
      case AppRoutes.signUpView:
        return MaterialPageRoute(builder: (context) =>  SignUpView());
      case AppRoutes.signInView:
        return MaterialPageRoute(builder: (context) =>  SignInView());

      case AppRoutes.homeView:
        return MaterialPageRoute(builder: (context) =>  HomeView());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body:  Center(child: Text('no route defind for ${settings.name}')),
          ),
        );
    }
  }
}
