import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/entites/article_entity.dart';
import 'package:news_app/features/explore/domain/repo/explore_repo.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit(this.exploreRepo) : super(ExploreInitial());
  final ExploreRepo exploreRepo;

  Future<void> categoryNews({required String category}) async {
    emit(ExploreLoading());
    final results = await exploreRepo.getCategoryNews(category: category);
    results.fold(
      (failure) => emit(ExploreFailure(message: failure.message)),
      (articles) => emit(ExploreSuccess(atticles: articles)),
    );
  }
}
