import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrendingItem extends StatelessWidget {
  const TrendingItem({
    super.key,
    required this.onTap,
    required this.title,
    this.titleColor,
    this.backgroundColor,
  });
  final void Function() onTap;
  final String title;
  final Color? titleColor;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: titleColor ?? Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
