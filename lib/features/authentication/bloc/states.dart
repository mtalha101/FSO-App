import 'package:equatable/equatable.dart';

enum AuthenticationStatus { authenticated, authenticating, unauthenticated, login, register, unknown }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;

  const AuthenticationState._({this.status = AuthenticationStatus.unknown});

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.login() : this._(status: AuthenticationStatus.login);

  const AuthenticationState.register() : this._(status: AuthenticationStatus.register);

  const AuthenticationState.authenticated() : this._(status: AuthenticationStatus.authenticated);

  const AuthenticationState.authenticating() : this._(status: AuthenticationStatus.authenticating);

  const AuthenticationState.unauthenticated() : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [status];
}
