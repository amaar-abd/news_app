import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/root_view.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/features/auth/presentation/views/signin_view.dart';
import 'package:news_app/features/auth/presentation/views/signup_view.dart';
import 'package:news_app/features/home/domain/entities/article_entity.dart';
import 'package:news_app/features/home/presentation/views/details_view.dart';
import 'package:news_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:news_app/features/splash/presentation/views/splash_view.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashView:
        return MaterialPageRoute(builder: (context) => SplashView());
      case AppRoutes.onBoardingView:
        return MaterialPageRoute(builder: (context) => OnBoardingView());
      case AppRoutes.signUpView:
        return MaterialPageRoute(builder: (context) => SignUpView());
      case AppRoutes.signInView:
        return MaterialPageRoute(builder: (context) => SignInView());
      case AppRoutes.rootView:
        return MaterialPageRoute(builder: (context) => RootView());
      case AppRoutes.detailsView:
        final article = settings.arguments as ArticleEntity;
        return MaterialPageRoute(
          builder: (context) => DetailsView(article: article),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('no route defind for ${settings.name}')),
          ),
        );
    }
  }
}
