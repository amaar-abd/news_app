import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/entites/article_entity.dart';
import 'package:news_app/core/models/article_model.dart';
import 'package:news_app/core/services/hive_service.dart';
part 'saved_article_state.dart';

class SavedArticleCubit extends Cubit<SavedArticleState> {
  SavedArticleCubit() : super(SavedArticleInitial());

  void featchSavedArticles() {
    emit(SavedArticleLoading());
    try {
      final articles = HiveService.getArticleList();
      if (articles.isEmpty) {
        emit(SavedArticleSuccess(articles: []));
      }
      final List<ArticleEntity> articlesEntity = articles
          .map((article) => article.toEntity())
          .toList();
      emit(SavedArticleSuccess(articles: articlesEntity));
    } catch (e) {
      emit(SavedArticleFailure(message: 'Failed to load saved articles'));
    }
  }

  Future<void> toggleSaved(ArticleModel article) async {
    final String title = article.title ?? '';
    if (title.isEmpty) return;

    try {
      if (HiveService.isArticleSaved(title)) {
        await HiveService.deletaArticle(title);
      } else {
        await HiveService.saveArticle(article);
      }
      featchSavedArticles();
    } catch (e) {
      emit(
        SavedArticleFailure(
          message: 'An error occurred while updating  the arcticles',
        ),
      );
    }
  }
}
