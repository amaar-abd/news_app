import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:news_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:news_app/features/search/presentation/widgets/bloc_builder_search_results.dart';
import 'package:news_app/features/search/presentation/widgets/search_appbar.dart';
import 'package:news_app/features/search/presentation/widgets/treding_items_grid_view.dart';
import 'package:news_app/features/search/presentation/widgets/trending_row.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchAppbar(),

            CustomTextFormField(
              prefixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [FaIcon(FontAwesomeIcons.magnifyingGlass)],
              ),
              suffixIcon: TextButton(
                onPressed: () {
                  context.read<SearchCubit>().searchNews(query: searchController.text);
                },
                child: Text(
                  'Search',
                  style: GoogleFonts.cairo(
                    color: AppColors.primaryColors,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              hintText: 'Enter the article title',
              obscureText: false,
              controller: searchController,
            ),
            SizedBox(height: 15),
            TrendingRow(),
            SizedBox(height: 20),
            TredingItemsGridView(searchController: searchController),
            SizedBox(height: 15),
            BlocBuilderSearchResults(),
            
          ],
        ),
      ),
    );
  }
}
