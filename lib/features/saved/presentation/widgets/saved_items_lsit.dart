import 'package:flutter/material.dart';
import 'package:news_app/core/dependency_injection/service_locator.dart';
import 'package:news_app/core/entites/article_entity.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/features/saved/presentation/manager/article_saved_cubit/saved_article_cubit.dart';
import 'package:news_app/features/saved/presentation/widgets/saved_item.dart';

class SavedItemsLsit extends StatelessWidget {
  const SavedItemsLsit({super.key, required this.articles});
  final List<ArticleEntity> articles;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return SavedItem(
          article: articles[index],
          onDelete: () {
            getIt.get<SavedArticleCubit>().toggleSaved(
              ArticleModel.fromEntity(articles[index]),
            );
          },
        );
      },
    );
  }
}
