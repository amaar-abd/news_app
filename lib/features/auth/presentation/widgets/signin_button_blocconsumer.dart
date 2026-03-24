import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/utils/main_button.dart';
import 'package:news_app/core/utils/snakbar.dart';
import 'package:news_app/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';

class SignInButtonBlocconsumer extends StatelessWidget {
  const SignInButtonBlocconsumer({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.globalKey,
    required this.onValidationError,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> globalKey;
  final VoidCallback onValidationError;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(

      listener: (context, state) {
         
        if (state is SignInSuccess) {
          buildsnakBar(
            context,
            message: 'Login Success',
            color: AppColors.primaryColors,
          );
          Navigator.pushNamed(context, AppRoutes.rootView);
        } else if (state is SignInFailure) {
          buildsnakBar(
            context,
            message: 'Login field : ${state.message}',
            color: AppColors.errorColor,
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is SignInLoading;
        return MainButton(
          onPressed: isLoading
              ? null
              : () {
                  if (globalKey.currentState!.validate()) {
                    context.read<SignInCubit>().signInByUserAccont(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  } else {
                    onValidationError();
                  }
                },
          text: isLoading ? null : 'LOGIN',
          widget: isLoading
              ? CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : null,
          fontWeight: FontWeight.w600,
        );
      },
    );
  }
}
