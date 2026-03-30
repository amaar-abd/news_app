import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreAppbar extends StatelessWidget {
  const ExploreAppbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
