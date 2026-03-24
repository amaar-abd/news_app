import 'package:flutter/material.dart';
import 'package:news_app/features/home/presentation/widgets/bloc_builder_topheadline.dart';
import 'package:news_app/features/home/presentation/widgets/custom_appbar.dart';
import 'package:news_app/features/home/presentation/widgets/top_headline_row.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Column(
        children: [
          CustomAppbar(),
          SizedBox(height: 15),
          TopHeadlineRow(title: 'Breaking News', subTitle: 'View All'),
          SizedBox(height: 20),
          BlocbuilderTopheadline(),
          SizedBox(height: 20),
          TopHeadlineRow(title: 'Recommendation', subTitle: 'View All'),
        ],
      ),
    );
  }
}
