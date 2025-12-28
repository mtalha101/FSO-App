import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fso/core/constants/colors.dart';
import 'package:fso/core/constants/spacings.dart';
import 'package:fso/core/widgets/button.dart';
import 'package:fso/core/widgets/textfield.dart';
import 'package:fso/features/authentication/bloc/bloc.dart';

import '../bloc/events.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthenticationBloc>();

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: AppSpacings.horizontal,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12.0),
                    const Text(
                      'Create an Account',
                      style: TextStyle(
                        fontFamily: 'DmSans',
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40.0),
                    FSOTextField(
                      hintText: 'Full Name',
                      suffixIcon: const Icon(
                        Icons.person_outline,
                        color: AppColors.kBorderColor,
                      ),
                      controller: authBloc.nameController,
                    ),
                    const SizedBox(height: 24.0),
                    FSOTextField(
                      hintText: 'Email',
                      suffixIcon: const Icon(
                        Icons.email_outlined,
                        color: AppColors.kBorderColor,
                      ),
                      controller: authBloc.emailController,
                    ),
                    const SizedBox(height: 24.0),
                    FSOTextField(
                      hintText: 'Phone',
                      suffixIcon: const Icon(
                        Icons.call_outlined,
                        color: AppColors.kBorderColor,
                      ),
                      controller: authBloc.phoneController,
                    ),
                    const SizedBox(height: 24.0),
                    FSOTextField(
                      hintText: 'Password',
                      obscured: true,
                      suffixIcon: const Icon(
                        Icons.visibility_outlined,
                        color: AppColors.kBorderColor,
                      ),
                      controller: authBloc.passwordController,
                    ),
                    const SizedBox(height: 24.0),
                    FSOTextField(
                      hintText: 'Confirm Password',
                      obscured: true,
                      suffixIcon: const Icon(
                        Icons.visibility_outlined,
                        color: AppColors.kBorderColor,
                      ),
                      controller: authBloc.confirmPasswordController,
                    ),
                    const SizedBox(height: 32.0),
                    FSOButton(
                      buttonText: 'Sign up',
                      onTap: () {
                        authBloc.add(const AuthenticationSignUpEvent());
                      },
                    ),
                    const SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: TextStyle(fontFamily: 'DMSans'),
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const LoginScreen(),
                            //   ),
                            // );
                            // Navigator.pop(context);
                            context.read<AuthenticationBloc>().add(const ToggleLoginScreenEvent());
                          },
                          child: const Text(
                            'Sign in',
                            style: TextStyle(fontFamily: 'DMSans'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
