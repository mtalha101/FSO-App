import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class CheckUserAuthEvent extends AuthenticationEvent {
  const CheckUserAuthEvent();
}

class ToggleLoginScreenEvent extends AuthenticationEvent {
  const ToggleLoginScreenEvent();
}

class ToggleRegisterScreenEvent extends AuthenticationEvent {
  const ToggleRegisterScreenEvent();
}

class AuthenticationLoginEvent extends AuthenticationEvent {
  const AuthenticationLoginEvent();
}

class AuthenticationSignUpEvent extends AuthenticationEvent {
  const AuthenticationSignUpEvent();
}

class AuthenticationForgotEvent extends AuthenticationEvent {
  const AuthenticationForgotEvent();
}

class AuthenticationLogoutEvent extends AuthenticationEvent {
  const AuthenticationLogoutEvent();
}
