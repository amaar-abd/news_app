import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'POFILE VIEW',
          textAlign: TextAlign.center,
          style: GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}