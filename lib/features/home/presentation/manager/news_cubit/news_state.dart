part of 'news_cubit.dart';

sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class TopheadlineLoading extends NewsState {}

final class TopheadlineSuccess extends NewsState {
  final List<ArticleEntity> articlesList;

  TopheadlineSuccess(this.articlesList);
}

final class TopheadlineFailure extends NewsState {
  final String message;

  TopheadlineFailure(this.message);
}


final class AllNewsLoading extends NewsState {}

final class AllNewsSuccess extends NewsState {
  final List<ArticleEntity> articlesList;

  AllNewsSuccess(this.articlesList);
}

final class AllNewsFailure extends NewsState {
  final String message;

  AllNewsFailure(this.message);
}
