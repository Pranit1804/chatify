// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitialState extends HomeState {}

class GetUserByInviteCodeSuccess extends HomeState {
  final UserEntity user;

  GetUserByInviteCodeSuccess(this.user);
}

class GetUserByInviteCodeFailure extends HomeState {}

class AddFriendSuccessState extends HomeState {}

class GetAllFriendsSuccessState extends HomeState {
  final List<UserEntity> friends;

  GetAllFriendsSuccessState(this.friends);
}
