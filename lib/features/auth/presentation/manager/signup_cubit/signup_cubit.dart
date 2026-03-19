import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/auth/domain/repos/auth_repository.dart';
part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit( this.authRepository) : super(SignUpInitial());
  final AuthRepository authRepository;

  Future<void> signUpAccountByUser({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    final result = await authRepository.createUserWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
    );
    result.fold(
      (l) => emit(SignUpFailure(l.message)),
      (r) => emit(SignUpSuccess()),
    );
  }
}
