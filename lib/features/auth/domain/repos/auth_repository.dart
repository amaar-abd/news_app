import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/features/auth/domain/entities/user_entity_data.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntityData>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });


}
