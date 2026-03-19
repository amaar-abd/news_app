import 'package:get_it/get_it.dart';
import 'package:news_app/features/auth/data/data_sources/fire_base_auth_services.dart';
import 'package:news_app/features/auth/data/repos/auth_repository_impl.dart';
import 'package:news_app/features/auth/domain/repos/auth_repository.dart';

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
}
