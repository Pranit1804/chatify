// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitialState extends AuthState {}

class SignupUserSuccessState extends AuthState {
  UserEntity userEntity;
  SignupUserSuccessState({
    required this.userEntity,
  });
}

class SignupUserFailureState extends AuthState {}
