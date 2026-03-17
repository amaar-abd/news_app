import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';

class CustomCheckboxRow extends StatelessWidget {
  const CustomCheckboxRow({super.key, this.value, this.onChanged});
  final bool? value;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primaryColors,
        ),
        RichText(
          text: TextSpan(
            style: GoogleFonts.cairo(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(text: 'By signing up, you agree to our '),
              TextSpan(
                text: 'Terms ',
                style: GoogleFonts.cairo(
                  color: AppColors.primaryColors,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(text: 'and \n'),
              TextSpan(
                text: 'Privacy',
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
