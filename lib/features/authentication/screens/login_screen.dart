import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fso/core/constants/colors.dart';
import 'package:fso/core/constants/spacings.dart';
import 'package:fso/core/widgets/button.dart';
import 'package:fso/core/widgets/textfield.dart';
import 'package:fso/features/authentication/bloc/bloc.dart';
import 'package:fso/features/authentication/bloc/states.dart';
import 'package:fso/features/authentication/screens/forgot_screen.dart';
import 'package:fso/features/authentication/screens/signup_screen.dart';

import '../bloc/events.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: AppSpacings.horizontal,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'DmSans',
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    FSOTextField(
                      hintText: 'Email',
                      suffixIcon: const Icon(
                        Icons.email_outlined,
                        color: AppColors.kBorderColor,
                      ),
                      controller: context.read<AuthenticationBloc>().emailController,
                    ),
                    const SizedBox(height: 24.0),
                    FSOTextField(
                        hintText: 'Password',
                        obscured: true,
                        suffixIcon: const Icon(
                          Icons.visibility_outlined,
                          color: AppColors.kBorderColor,
                        ),
                        controller: context.read<AuthenticationBloc>().passwordController),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgotScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Forget Password?',
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32.0),
                    FSOButton(
                      buttonText: 'Sign in',
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const NavScreen(),
                        //   ),
                        // );
                        context.read<AuthenticationBloc>().add(const AuthenticationLoginEvent());
                      },
                      loading: false,
                    ),
                    const SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        const Text(
                          'Don\'t have an account? ',
                          style: TextStyle(fontFamily: 'DMSans'),
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const SignUpScreen(),
                            //   ),
                            // );
                            context.read<AuthenticationBloc>().add(const ToggleRegisterScreenEvent());
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(fontFamily: 'DMSans'),
                          ),
                        ),
                      ],
                    )
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
