import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';

class ActivitiesRow extends StatelessWidget {
  const ActivitiesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '124',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'ARTICLES READ',
                    style: GoogleFonts.cairo(
                      fontSize: 15,
                      color: AppColors.secondColors,
                    ),
                  ),
                ],
              ),
              VerticalDivider(),
              Column(
                children: [
                  Text(
                    '18',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'SAVED',
                    style: GoogleFonts.cairo(
                      fontSize: 15,
                      color: AppColors.secondColors,
                    ),
                  ),
                ],
              ),
              VerticalDivider(),
              Column(
                children: [
                  Text(
                    '12',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'FOLLOWING',
                    style: GoogleFonts.cairo(
                      fontSize: 15,
                      color: AppColors.secondColors,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
