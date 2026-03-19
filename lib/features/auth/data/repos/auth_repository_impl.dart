import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/errors/custom_exception.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/features/auth/data/data_sources/fire_base_auth_services.dart';
import 'package:news_app/features/auth/domain/entities/user_entity_data.dart';
import 'package:news_app/features/auth/domain/repos/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FireBaseAuthServices fireBaseAuthServices;
  AuthRepositoryImpl({required this.fireBaseAuthServices});

  @override
  Future<Either<Failure, UserEntityData>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      user = await fireBaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserEntityData(name, email, user.uid));
    } on CustomException catch (e) {
      if (user != null) {
        await fireBaseAuthServices.deleteUser();
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
