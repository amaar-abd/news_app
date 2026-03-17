import 'package:flutter/material.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/utils/main_button.dart';
import 'package:news_app/features/auth/presentation/widgets/custom_checkbox_row.dart';
import 'package:news_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:news_app/features/auth/presentation/widgets/top_head_line_auth_widget.dart';
import 'package:news_app/features/auth/presentation/widgets/user_question_row.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
bool _isObscure = true;
bool _isAccepted = false;

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopHeadLineAuthWidget(
                title: 'Create Account',
                subTitle: 'Get started for free',
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                title: 'Full Name',
                hintText: 'ammar abd',
                icon: null,
                controller: nameController,
              ),
              CustomTextFormField(
                title: 'Email Address',
                hintText: 'Entry your email',
                icon: null,
                controller: emailController,
              ),
              CustomTextFormField(
                title: 'Password',
                hintText: 'Choose a strong password ',
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
              CustomCheckboxRow(
                value: _isAccepted,
                onChanged: (value) {
                  setState(() {
                    _isAccepted = value ?? false;
                  });
                },
              ),
              SizedBox(height: 50),
              MainButton(
                onPressed: () {},
                text: 'CREATE ACCOUNT',
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 20),

              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.signInView);
                },
                child: UserQuestionRow(
                  ask: 'Already have an account? ',
                  answer: 'Login',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
