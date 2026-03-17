import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';

class DividerSignupWidget extends StatelessWidget {
  const DividerSignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider()),
        const SizedBox(width: 8),
        Text(
          'Or Continue With',
          style: GoogleFonts.cairo(
            color: AppColors.secondColors,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(child: Divider()),
      ],
    );
  }
}
