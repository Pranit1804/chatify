part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignupUserEvent extends AuthEvent {
  final UserRequestModel userRequestModel;

  SignupUserEvent(this.userRequestModel);
}

class LoginUserEvent extends AuthEvent {
  final UserRequestModel userRequestModel;

  LoginUserEvent(this.userRequestModel);
}
