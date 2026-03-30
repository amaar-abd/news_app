import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/core/entites/article_entity.dart';
import 'package:news_app/features/search/domain/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;
  Future<void> searchNews({required String query}) async {
    emit(SearchLoading());
    final result = await searchRepo.getNewsByQuery(query: query);
    result.fold(
      (failure) => emit(SearchFailure(failure.message)),
      (articles) => emit(SearchSuccess(articles)),
    );
  }
}
