import 'package:flutter/material.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/utils/app_iamges.dart';
import 'package:news_app/features/auth/presentation/widgets/accounts_button.dart';
import 'package:news_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:news_app/features/auth/presentation/widgets/divider_signup_widget.dart';
import 'package:news_app/features/auth/presentation/widgets/signin_button_blocconsumer.dart';
import 'package:news_app/features/auth/presentation/widgets/top_head_line_auth_widget.dart';
import 'package:news_app/features/auth/presentation/widgets/user_question_row.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopHeadLineAuthWidget(
                title: 'Welcome Back',
                subTitle: 'Sign in to access your news.',
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                title: 'Email',
                hintText: 'Entry your email',
                obscureText: false,
                icon: Icon(Icons.email),
                controller: emailController,
              ),
              CustomTextFormField(
                title: 'Password',
                hintText: 'Enter your password ',
                obscureText: _isObscure,
                icon: InkWell(
                  onTap: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  child: _isObscure
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.remove_red_eye),
                ),
                controller: passwordController,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [UserQuestionRow(answer: 'Forgot Password ? ')],
              ),
              SizedBox(height: 20),
              SignInButtonBlocconsumer(
                emailController: emailController,
                passwordController: passwordController,
                globalKey: _globalKey,
                onValidationError: () {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                },
              ),
              SizedBox(height: 25),
              DividerSignupWidget(),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AccountsButton(
                    widget: Image.asset(Assets.assetsImagesGoogleIcon),
                    text: 'Google',
                  ),
                  AccountsButton(
                    widget: Image.asset(Assets.assetsImagesMeta),
                    text: 'Facebook',
                  ),
                ],
              ),
              SizedBox(height: 20),

              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.signUpView);
                },
                child: UserQuestionRow(
                  ask: 'Don\'t have an account? ',
                  answer: 'Sign Up',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
