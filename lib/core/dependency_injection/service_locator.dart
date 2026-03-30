import 'package:get_it/get_it.dart';
import 'package:news_app/core/api/web_services.dart';
import 'package:news_app/core/data_source/news_remote_data_source.dart';
import 'package:news_app/features/auth/data/data_sources/fire_base_auth_services.dart';
import 'package:news_app/features/auth/data/repos/auth_repository_impl.dart';
import 'package:news_app/features/auth/domain/repos/auth_repository.dart';
import 'package:news_app/features/explore/data/repo/explore_repo_impl.dart';
import 'package:news_app/features/explore/domain/repo/explore_repo.dart';
import 'package:news_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:news_app/features/home/data/repo/news_repository_impl.dart';
import 'package:news_app/features/home/domain/repo/news_repository.dart';
import 'package:news_app/features/search/data/repo/search_repo_impl.dart';
import 'package:news_app/features/search/domain/search_repo.dart';

final GetIt getIt = GetIt.instance;
sutupServiceLocator() {
  getIt.registerLazySingleton<FireBaseAuthServices>(
    () => FireBaseAuthServices(),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      fireBaseAuthServices: getIt.get<FireBaseAuthServices>(),
    ),
  );
  getIt.registerLazySingleton<WebServices>(() => WebServices());

  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(webServices: getIt.get<WebServices>()),
  );
  getIt.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSource(webServices: getIt.get<WebServices>()),
  );
  getIt.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      homeRemoteDataSource: getIt.get<HomeRemoteDataSource>(),
      newsRemoteDataSource: getIt.get<NewsRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<SearchRepo>(
    () =>
        SearchRepoImpl(newsRemoteDataSource: getIt.get<NewsRemoteDataSource>()),
  );

  getIt.registerLazySingleton<ExploreRepo>(
    () => ExploreRepoImpl(
      newsRemoteDataSource: getIt.get<NewsRemoteDataSource>(),
    ),
  );
}
