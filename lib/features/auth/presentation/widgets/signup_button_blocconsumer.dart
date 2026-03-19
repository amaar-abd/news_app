import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/core/utils/main_button.dart';
import 'package:news_app/core/utils/snakbar.dart';
import 'package:news_app/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';

class SignUpButtonBlocConsumer extends StatelessWidget {
  const SignUpButtonBlocConsumer({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.onValidationError,
    required this.isAccepted,
  });
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final VoidCallback onValidationError;
  final bool isAccepted;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          buildsnakBar(
            context,
            message: 'Account created',
            color: AppColors.primaryColors,
          );
          Navigator.pop(context);
        } else if (state is SignUpFailure) {
          buildsnakBar(
            context,
            message: state.message,
            color: AppColors.errorColor,
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is SignUpLoading;
        return MainButton(
          onPressed: isLoading
              ? null
              : () {
                  if (formKey.currentState!.validate()) {
                    if (isAccepted) {
                      context.read<SignUpCubit>().signUpAccountByUser(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    } else {
                      buildsnakBar(
                        context,
                        message: 'Please accept the terms',
                        color: AppColors.errorColor,
                      );
                    }
                  } else {
                    onValidationError();
                  }
                },
          text: isLoading ? null : 'CREATE ACCOUNT',
          fontWeight: FontWeight.w600,
          widget: isLoading
              ? const CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : null,
        );
      },
    );
  }
}
