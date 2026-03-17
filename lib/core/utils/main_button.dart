import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onPressed,
    required this.text,
   
    this.isVisible = true, 
    this.fontWeight,
  });
  final VoidCallback onPressed;
  final String text;
  final bool isVisible;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox(
          height: 54,
          width: double.infinity,
          child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primaryColors,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
            ),
            child: Text(
              text,
              style: GoogleFonts.cairo(
                fontSize: 20,
                fontWeight: fontWeight,
                color: Colors.white,
              ),
           
            ),
          ),
        ),
      ),
    );
  }
}
