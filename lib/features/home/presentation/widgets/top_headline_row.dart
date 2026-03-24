import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';

class TopHeadlineRow extends StatelessWidget {
  const TopHeadlineRow({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.cairo(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Text(
          subTitle,
          style: GoogleFonts.cairo(
            fontSize: 15,
            color: AppColors.primaryColors,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
