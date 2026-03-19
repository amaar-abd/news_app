import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/auth/domain/entities/user_entity_data.dart';
import 'package:news_app/features/auth/domain/repos/auth_repository.dart';
part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepository) : super(SignInInitial());
  final AuthRepository authRepository;

  Future<void> signInByUserAccont({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    final result = await authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (l) => emit(SignInFailure(message: l.message)),
      (r) => emit(SignInSuccess(userEntityData: r)),
    );
  }
}
