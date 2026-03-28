import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/features/home/presentation/manager/news_cubit/news_cubit.dart';
import 'package:news_app/features/home/presentation/widgets/news_item_list.dart';

class BlocBuilderAllNews extends StatelessWidget {
  const BlocBuilderAllNews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit,NewsState>(
      buildWhen: (previous, current) =>
          current is AllNewsLoading ||
          current is AllNewsSuccess ||
          current is AllNewsFailure,
      builder: (context, state) {
        if (state is AllNewsLoading) {
          return CircularProgressIndicator(color: AppColors.primaryColors);
        } else if (state is AllNewsSuccess) {
          final articleList = state.articlesList;
          return NewsItemList(article: articleList,);
        } else if (state is AllNewsFailure) {
          return Center(child: Text(state.message));
        }else{
          return SizedBox();
        }
      },
    );
  }
}
