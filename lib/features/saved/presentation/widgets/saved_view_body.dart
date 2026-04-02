import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/features/saved/presentation/widgets/bloc_builder_saved_lsit.dart';
import 'package:news_app/features/saved/presentation/widgets/saved_appbar.dart';

class SavedViewBody extends StatelessWidget {
  const SavedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SavedAppbar(),
          SizedBox(height: 20),
          Text(
            'SAVED FOR LATER',
            style: GoogleFonts.cairo(
              color: AppColors.primaryColors,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Catch up on the articles and stories you saved',
            style: GoogleFonts.cairo(
              fontSize: 20,
              fontWeight: FontWeight.bold,
             
            ),
          ),

          SizedBox(height: 15),
          BlocBuilderSavedLsit(),
        ],
      ),
    );
  }
}
