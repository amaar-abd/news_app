import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_iamges.dart';
import 'package:news_app/features/on_boarding/presentation/widgets/page_widget.dart';

class PagesViewWidget extends StatelessWidget {
  const PagesViewWidget({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageWidget(
          image: Assets.assetsImagesPhonewithmessages,
          title: 'Stay Ahead of the Curve',
          subTitle:
              'Get real-time updates and breaking news\n from around  the world, tailored just \nfor you.',
        ),

        PageWidget(
          image: Assets.assetsImagesPhonewithhand,
          title: 'News That Matters to You',
          subTitle:
              'Follow your favorite topics. journalists,\n and sources to create afeed that reflects \nyour intersts.',
        ),
      ],
    );
  }
}
