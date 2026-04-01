import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/dependency_injection/service_locator.dart';
import 'package:news_app/features/saved/presentation/manager/article_saved_cubit/saved_article_cubit.dart';
import 'package:news_app/features/saved/presentation/widgets/saved_items_lsit.dart';

class BlocBuilderSavedLsit extends StatelessWidget {
  const BlocBuilderSavedLsit({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<SavedArticleCubit>()..featchSavedArticles(),
      child: Expanded(
        child: BlocBuilder<SavedArticleCubit, SavedArticleState>(
          builder: (context, state) {
            if (state is SavedArticleSuccess) {
              if (state.articles.isEmpty) {
                return Center(
                  child: Text(
                    'There are no articles reserved',
                    style: GoogleFonts.cairo(
                      color: AppColors.primaryColors,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
              return SavedItemsLsit(articles: state.articles);
            } else if (state is SavedArticleLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColors,
                ),
              );
            } else if (state is SavedArticleFailure) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
