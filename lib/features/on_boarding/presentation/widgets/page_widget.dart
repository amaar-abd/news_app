import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';

class PageWidget extends StatelessWidget {
  const PageWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Image.asset(image, width: 250, height: 250),
          SizedBox(height: 40),
          Text(
            title,
            style: GoogleFonts.cairo(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 300,
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColors.secondColors),
            ),
          ),
        ],
      ),
    );
  }
}
