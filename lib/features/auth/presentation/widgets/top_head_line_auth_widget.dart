import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';

class TopHeadLineAuthWidget extends StatelessWidget {
  const TopHeadLineAuthWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        SizedBox(
          height: 100,
          width: 100,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.primaryColors,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Center(
              child: Text(
                'N',
                style: GoogleFonts.cairo(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: GoogleFonts.cairo(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        Text(
          subTitle,
          style: GoogleFonts.cairo(
            fontSize: 17,
            color: AppColors.secondColors,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
