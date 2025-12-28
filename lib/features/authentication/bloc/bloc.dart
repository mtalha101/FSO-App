// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fso/features/authentication/bloc/events.dart';
import 'package:fso/features/authentication/bloc/states.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState.unknown()) {
    on<AuthenticationEvent>((event, emit) async {
      print(event.runtimeType);
      if (event == const CheckUserAuthEvent()) {
        if (FirebaseAuth.instance.currentUser != null) {
          emit(const AuthenticationState.authenticated());
        } else {
          emit(const AuthenticationState.unauthenticated());
        }
      }
      if (event == const ToggleLoginScreenEvent()) {
        print('Login');
        emit(const AuthenticationState.login());
      }
      if (event == const ToggleRegisterScreenEvent()) {
        print('Register');
        emit(const AuthenticationState.register());
      }
      if (event == const AuthenticationLoginEvent()) {
        // emit(const AuthenticationState.authenticating());

        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text);

          emit(const AuthenticationState.authenticated());

          emailController.clear();
          passwordController.clear();
        } on FirebaseAuthException catch (e) {
          if (scaffold != null) {
            scaffold!.showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(e.code),
              ),
            );
          }
        }
      }

      if (event == const AuthenticationSignUpEvent()) {
        // emit(const AuthenticationState.authenticating());
        if (passwordController.text != confirmPasswordController.text) {
          if (scaffold != null) {
            scaffold!.showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('Passwords don\'t match'),
              ),
            );
          }
          return;
        }

        try {
          final user = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailController.text.trim(),
                  password: passwordController.text);

          await FirebaseAuth.instance.currentUser!
              .updateDisplayName(nameController.text.trim());

          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.user!.uid)
              .set({
            "email": emailController.text.trim(),
            "name": nameController.text.trim(),
            "phone": phoneController.text.trim(),
          });

          emit(const AuthenticationState.authenticated());

          emailController.clear();
          passwordController.clear();
          phoneController.clear();
          nameController.clear();
          confirmPasswordController.clear();
        } on FirebaseAuthException catch (e) {
          if (scaffold != null) {
            scaffold!.showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(e.message ?? ''),
              ),
            );
          }
        }
      }
      if (event == const AuthenticationForgotEvent()) {
        try {
          await FirebaseAuth.instance
              .sendPasswordResetEmail(email: emailController.text.trim());
          if (scaffold != null) {
            scaffold!.showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                    'An email has been sent to ${emailController.text.trim()}'),
              ),
            );
          }
          emailController.clear();
        } on FirebaseAuthException catch (e) {
          if (scaffold != null) {
            scaffold!.showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(e.message ?? ''),
              ),
            );
          }
        }
      }
      if (event == const AuthenticationLogoutEvent()) {
        print('Ran');
        await FirebaseAuth.instance.signOut();
        emit(const AuthenticationState.unauthenticated());
      }
    });
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  ScaffoldMessengerState? scaffold;

  void setScaffold(ScaffoldMessengerState val) {
    scaffold = val;
  }
}
