import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';

class UserQuestionRow extends StatelessWidget {
  const UserQuestionRow({super.key, this.ask, required this.answer});
  final String? ask;
  final String answer;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            style: GoogleFonts.cairo(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(text: ask),
              TextSpan(
                text: answer,
                style: GoogleFonts.cairo(
                  color: AppColors.primaryColors,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
