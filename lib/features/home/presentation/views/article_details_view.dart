import 'package:flutter/material.dart';
import 'package:news_app/core/entites/article_entity.dart';
import 'package:news_app/features/home/presentation/widgets/article_details_view_body.dart';

class ArticeDetailsView extends StatelessWidget {
  const ArticeDetailsView({super.key, required this.article});
  final ArticleEntity article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ArticleDetailsViewBody(article: article)),
    );
  }
}
