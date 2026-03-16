import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_colors.dart';
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
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: Image.asset(
              Assets.assetsImagesLogo,
              height: 170,
              width: 170,
            ),
          ),
          SizedBox(height: 40),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'NEWS ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: 'PRIMY',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColors,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'YOUR DAILY PERSPECTIVE',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(letterSpacing: 1.8),
          ),
        ],
      ),
    );
  }

  void navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, AppRoutes.homeView);
    });
  }
}
