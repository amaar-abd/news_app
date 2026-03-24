import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/features/home/presentation/manager/news_cubit/news_cubit.dart';
import 'package:news_app/features/home/presentation/widgets/home_carousel_slider.dart';

class BlocbuilderTopheadline extends StatelessWidget {
  const BlocbuilderTopheadline({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit,NewsState>(
      buildWhen: (previous, current) =>
          current is TopheadlineLoading ||
          current is TopheadlineSuccess ||
          current is TopheadlineFailure,
      builder: (context, state) {
        if (state is TopheadlineLoading) {
          return CircularProgressIndicator(color: AppColors.primaryColors);
        } else if (state is TopheadlineSuccess) {
          final articleList = state.articlesList;
          return HomeCarouselSlider(articleEntity: articleList);
        } else if (state is TopheadlineFailure) {
          return Center(child: Text(state.message));
        }else{
          return SizedBox();
        }
      },
    );
  }
}