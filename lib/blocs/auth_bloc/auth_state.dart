part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

abstract class AuthActionState extends AuthState{}

class LoginState extends AuthState {}

class SignUpState extends AuthState {}

class LoadingState extends AuthState {}

class ErrorState extends AuthActionState {
  final String errmsg;

  ErrorState(this.errmsg);
}

class AuthSuccessState extends AuthActionState {}

class ProfileIncompleteState extends AuthActionState {}

