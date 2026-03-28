import 'package:flutter/material.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/utils/app_iamges.dart';

class SpalshViewBody extends StatefulWidget {
  const SpalshViewBody({super.key});

  @override
  State<SpalshViewBody> createState() => _SpalshViewBodyState();
}

class _SpalshViewBodyState extends State<SpalshViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(Assets.assetsImagesLogo, height: 350, width: 350),
    );
  }

  void navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, AppRoutes.onBoardingView);
    });
  }
}
