import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/features/explore/presentation/widgets/category_grid_view.dart';
import 'package:news_app/features/explore/presentation/widgets/explore_appbar.dart';

class ExploreViewBody extends StatelessWidget {
  const ExploreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExploreAppbar(title: 'EXPLORE',),
          SizedBox(height: 20),
          Text(
            'CURATED CONTENT',
            style: GoogleFonts.cairo(
              color: AppColors.primaryColors,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Explore Categories',
            style: GoogleFonts.cairo(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Discover deep insights across diverse interests and global trends.',
            style: GoogleFonts.cairo(
              color: AppColors.secondColors,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 15),
           Expanded(child: CategoryGridView()),
        ],
      ),
    );
  }
}
