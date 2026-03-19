import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/dependency_injection/service_locator.dart';
import 'package:news_app/features/auth/domain/repos/auth_repository.dart';
import 'package:news_app/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:news_app/features/auth/presentation/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SignInCubit(getIt.get<AuthRepository>()),
          child: SignInViewBody(),
        ),
      ),
    );
  }
}
