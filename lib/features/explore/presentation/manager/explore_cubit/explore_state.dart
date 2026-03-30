part of 'explore_cubit.dart';

sealed class ExploreState {}

final class ExploreInitial extends ExploreState {}

final class ExploreLoading extends ExploreState {}

final class ExploreSuccess extends ExploreState {
  final List<ArticleEntity> atticles;

  ExploreSuccess({required this.atticles});
}

final class ExploreFailure extends ExploreState {
  final String message;

  ExploreFailure({required this.message});
}
