import 'package:flutter/widgets.dart';
import 'package:news_app/core/entites/article_entity.dart';
import 'package:news_app/features/explore/presentation/widgets/explore_details_item.dart';

class ExploreDetailsListView extends StatelessWidget {
  const ExploreDetailsListView({super.key, required this.articles});
  final List<ArticleEntity> articles;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ExploreDetailsItem(article: articles[index]);
      },
    );
  }
}
