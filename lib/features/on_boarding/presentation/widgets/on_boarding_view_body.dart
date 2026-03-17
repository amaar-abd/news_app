import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/utils/main_button.dart';
import 'package:news_app/features/on_boarding/presentation/widgets/pages_view_widget.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

late PageController pageController;
int pageIndex = 0;

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      pageIndex = pageController.page!.round();
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'News Primy',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            SizedBox(height: 20),
            SizedBox(
              height: 450,
              child: PagesViewWidget(pageController: pageController),
            ),
            DotsIndicator(
              position: 1,
              dotsCount: 2,
              decorator: DotsDecorator(
                color: AppColors.primaryColors,
                activeColor: pageIndex == 1
                    ? AppColors.primaryColors
                    : Colors.blue[100],
                activeSize: Size(25, 10),
                size: Size(25, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            viewButton(pageIndex),
            SizedBox(width: 30),
          ],
        ),
        Positioned(
          top: 20,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.signInView);
              },
              child: Text(
                'Skip',
                style: GoogleFonts.cairo(
                  color: AppColors.primaryColors,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget viewButton(int pageIndex) {
    if (pageIndex == 0) {
      return MainButton(
        onPressed: () {
          pageController.animateToPage(
            1,
            duration: Durations.extralong1,
            curve: Curves.bounceIn,
          );
        },
        text: 'Next',
      );
    } else {
      return MainButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.signInView);
        },
        text: 'Get Started',
      );
    }
  }
}
