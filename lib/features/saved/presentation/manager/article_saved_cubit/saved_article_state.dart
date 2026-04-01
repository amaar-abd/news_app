part of 'saved_article_cubit.dart';


sealed class SavedArticleState {}

final class SavedArticleInitial extends SavedArticleState {}

final class SavedArticleLoading extends SavedArticleState {}

final class SavedArticleSuccess extends SavedArticleState {
  final List<ArticleEntity> articles;
  SavedArticleSuccess({required this.articles});
}

final class SavedArticleFailure extends SavedArticleState {
  final String message;
  SavedArticleFailure({required this.message});
}
