part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignupUserEvent extends AuthEvent {
  final UserRequestModel userRequestModel;

  SignupUserEvent(this.userRequestModel);
}
