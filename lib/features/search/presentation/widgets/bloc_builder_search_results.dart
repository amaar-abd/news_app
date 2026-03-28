import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/features/home/presentation/widgets/news_item_list.dart';
import 'package:news_app/features/search/presentation/manager/search_cubit/search_cubit.dart';

class BlocBuilderSearchResults extends StatelessWidget {
  const BlocBuilderSearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .5,
      width: double.infinity,
      child: BlocBuilder<SearchCubit, SearchState>(
        buildWhen: (previous, current) =>
            current is SearchLoading ||
            current is SearchSuccess ||
            current is SearchFailure,
        builder: (context, state) {
          if (state is SearchLoading) {
            return CircularProgressIndicator(color: AppColors.primaryColors);
          } else if (state is SearchSuccess) {
            final articleList = state.articles;
            return Column(
              children: [
                
                NewsItemList(
                  article: articleList,
                ),
              ],
            );
          } else if (state is SearchFailure) {
            return Center(child: Text(state.message));
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
