import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/dependency_injection/service_locator.dart';
import 'package:news_app/features/auth/domain/repos/auth_repository.dart';
import 'package:news_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:news_app/features/auth/presentation/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SignUpCubit(getIt.get<AuthRepository>()),
          child: SignUpViewBody(),
        ),
      ),
    );
  }
}
