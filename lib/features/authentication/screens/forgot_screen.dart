import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fso/core/constants/colors.dart';
import 'package:fso/core/constants/spacings.dart';
import 'package:fso/core/widgets/button.dart';
import 'package:fso/core/widgets/textfield.dart';
import 'package:fso/features/authentication/bloc/bloc.dart';

import '../bloc/events.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          scrolledUnderElevation: 0.0,
        ),
        body: SafeArea(
          child: Padding(
            padding: AppSpacings.horizontal,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Forgot Password',
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
                    const SizedBox(height: 32.0),
                    FSOButton(
                      buttonText: 'Send Email Link',
                      onTap: () {
                        context.read<AuthenticationBloc>().add(const AuthenticationForgotEvent());
                      },
                      loading: false,
                    ),
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
