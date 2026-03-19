part of 'signin_cubit.dart';

sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  final UserEntityData userEntityData;

  SignInSuccess({required this.userEntityData});
}

final class SignInFailure extends SignInState {
  final String message;

  SignInFailure({required this.message});
}
