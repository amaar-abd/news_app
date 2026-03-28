import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TrendingRow extends StatelessWidget {
  const TrendingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(FontAwesomeIcons.arrowTrendUp, color: Colors.red),
        SizedBox(width: 8),
        Text(
          'Trending Now',
          style: GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
