import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/features/home/presentation/widgets/custom_icon_button.dart';

class SearchAppbar extends StatelessWidget {
  const SearchAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          icon: FontAwesomeIcons.chevronLeft,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Expanded(
          child: Text(
            'Search',
            textAlign: TextAlign.center,
            style: GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 40),
      ],
    );
  }
}
