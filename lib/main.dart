import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fso/core/constants/colors.dart';
import 'package:fso/features/authentication/bloc/bloc.dart';
import 'package:fso/features/authentication/bloc/states.dart';
import 'package:fso/features/authentication/screens/login_screen.dart';
import 'package:fso/features/authentication/screens/signup_screen.dart';
import 'package:fso/features/home/screens/nav_screen.dart';
import 'package:fso/firebase_options.dart';

import 'features/authentication/bloc/events.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AuthenticationBloc()..add(const CheckUserAuthEvent());
      },
      child: MaterialApp(
        title: 'FSO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
          useMaterial3: true,
        ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            context.read<AuthenticationBloc>().setScaffold(ScaffoldMessenger.of(context));
            if (state == const AuthenticationState.authenticated()) {
              return const NavScreen();
            }
            if (state == const AuthenticationState.register()) {
              return const SignUpScreen();
            }
            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
