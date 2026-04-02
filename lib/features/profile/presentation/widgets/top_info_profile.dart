import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/utils/app_iamges.dart';

class TopInfoProfile extends StatelessWidget {
  const TopInfoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.primaryColors,
          radius: 65,
          child: CircleAvatar(
            backgroundImage: AssetImage(Assets.assetsImagesMe),
            radius: 60,
          ),
        ),
        SizedBox(height: 10),

        Text(
          'Ammar Abd Alrahman',
          style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.solidStar,
              size: 18,
              color: AppColors.primaryColors,
            ),
            SizedBox(width: 5),
            Text(
              'Premium Member',
              style: GoogleFonts.cairo(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColors,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
