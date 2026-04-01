import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedAppbar extends StatelessWidget {
  const SavedAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'SAVED VIEW',
          textAlign: TextAlign.center,
          style: GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}