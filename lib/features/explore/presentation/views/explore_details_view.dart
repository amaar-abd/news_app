import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/dependency_injection/service_locator.dart';
import 'package:news_app/features/explore/domain/repo/explore_repo.dart';
import 'package:news_app/features/explore/presentation/manager/explore_cubit/explore_cubit.dart';
import 'package:news_app/features/explore/presentation/widgets/explore_details_view_body.dart';

class ExploreDetailsView extends StatelessWidget {
  const ExploreDetailsView({super.key, required this.categoryNmae});
  final String categoryNmae;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ExploreCubit(getIt.get<ExploreRepo>())..categoryNews(category: categoryNmae),
          child: ExploreDetailsViewBody(categoryName: categoryNmae,),
        ),
      ),
    );
  }
}
