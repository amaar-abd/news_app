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
