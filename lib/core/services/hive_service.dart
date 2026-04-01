import 'package:hive_flutter/adapters.dart';
import 'package:news_app/core/constants/api_constants.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/models/source_model.dart';

class HiveService {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ArticleModelAdapter());
    Hive.registerAdapter(SourceAdapter());
    await Hive.openBox<ArticleModel>(ApiConstants.articlesSaved);
  }

  static Future<void> saveArticle(ArticleModel article) async {
    var box = Hive.box<ArticleModel>(ApiConstants.articlesSaved);
    await box.put(article.title, article);
  }

  static Future<void> deletaArticle(String title) async {
    var box = Hive.box<ArticleModel>(ApiConstants.articlesSaved);
    await box.delete(title);
  }

  static List<ArticleModel> getArticleList() {
    var box = Hive.box<ArticleModel>(ApiConstants.articlesSaved);
    return box.values.toList();
  }

  static bool isArticleSaved(String title) {
    var box = Hive.box<ArticleModel>(ApiConstants.articlesSaved);
    return box.containsKey(title);
  }
}
