import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.obscureText,
    this.icon,
  });
  final String title;
  final String hintText;
  final Widget? icon;
  final bool? obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 8),

        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 4)],
          ),
          child: TextFormField(
            obscureText: obscureText ?? true,
            controller: controller,
            validator: (value) =>
                value == null || value.isEmpty ? 'cant bd empty' : null,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              suffixIcon: icon,
              hint: Text(
                hintText,
                style: GoogleFonts.cairo(fontSize: 15, color: Colors.grey[500]),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.primaryColors),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
