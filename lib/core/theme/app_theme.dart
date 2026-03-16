import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData mainTheme = ThemeData(
    scaffoldBackgroundColor:  Colors.white,
      
    textTheme: GoogleFonts.vazirmatnTextTheme().copyWith(
      displayLarge: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
      titleMedium: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      bodyMedium: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
    )
  );
}
