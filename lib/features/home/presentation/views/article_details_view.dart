import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/dependency_injection/service_locator.dart';
import 'package:news_app/core/entites/article_entity.dart';
import 'package:news_app/features/home/presentation/widgets/article_details_view_body.dart';
import 'package:news_app/features/saved/presentation/manager/article_saved_cubit/saved_article_cubit.dart';

class ArticeDetailsView extends StatelessWidget {
  const ArticeDetailsView({super.key, required this.article});
  final ArticleEntity article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider.value(
          value: getIt.get<SavedArticleCubit>(),
          child: ArticleDetailsViewBody(article: article),
        ),
      ),
    );
  }
}
