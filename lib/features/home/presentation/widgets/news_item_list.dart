import 'package:flutter/material.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/entites/article_entity.dart';
import 'package:news_app/features/home/presentation/widgets/news_item.dart';

class NewsItemList extends StatelessWidget {
  const NewsItemList({super.key, required this.article});

  final List<ArticleEntity> article;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: article.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: InkWell(
              onTap: () {
                Navigator.of(context, rootNavigator: true).pushNamed(
                  AppRoutes.articleDetailsView,
                  arguments: article[index],
                );
              },
              child: NewsItem(article: article[index]),
            ),
          );
        },
      ),
    );
  }
}
