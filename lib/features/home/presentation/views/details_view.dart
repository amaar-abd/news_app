import 'package:flutter/material.dart';
import 'package:news_app/core/entites/article_entity.dart';
import 'package:news_app/features/home/presentation/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.article});
  final ArticleEntity article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: DetailsViewBody(article: article)),
    );
  }
}
