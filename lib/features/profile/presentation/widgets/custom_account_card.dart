import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/features/profile/presentation/widgets/custom_card_item.dart';

class CustomAccountCard extends StatelessWidget {
  const CustomAccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ACCOUNT',
          style: GoogleFonts.cairo(
            fontSize: 18,
            color: AppColors.secondColors,
            letterSpacing: 2,
          ),
        ),
        SizedBox(height: 8),
        Card(
          color: Colors.grey.shade100,

          child: Column(
            children: [
              CustomCardItem(
                title: 'Personal Information',
                leadingIcon: FaIcon(
                  FontAwesomeIcons.solidUser,
                  color: AppColors.primaryColors,
                ),
                trailing: FaIcon(FontAwesomeIcons.chevronRight),
              ),
              SizedBox(height: 5),
              CustomCardItem(
                title: 'Notification Setings',
                leadingIcon: FaIcon(
                  FontAwesomeIcons.solidBell,
                  color: AppColors.primaryColors,
                ),
                trailing: FaIcon(FontAwesomeIcons.chevronRight),
              ),
              SizedBox(height: 5),
              CustomCardItem(
                title: 'Privacy Policy',
                leadingIcon: FaIcon(
                  FontAwesomeIcons.shieldHalved,
                  color: AppColors.primaryColors,
                ),
                trailing: FaIcon(FontAwesomeIcons.chevronRight),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
