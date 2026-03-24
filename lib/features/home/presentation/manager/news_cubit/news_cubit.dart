import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/domain/entities/article_entity.dart';
import 'package:news_app/features/home/domain/repo/news_repository.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.repository) : super(NewsInitial());
  final NewsRepository repository;

  Future<void> topHeadlineNews() async {
    emit(TopheadlineLoading());
    final result = await repository.topHeadlineNews();
    result.fold(
      (l) => emit(TopheadlineFailure(l.message)),
      (r) => emit(TopheadlineSuccess(r)),
    );
  }
}
