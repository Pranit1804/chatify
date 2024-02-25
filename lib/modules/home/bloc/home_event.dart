part of 'home_bloc.dart';

abstract class HomeEvent {}

class AddFriendEvent extends HomeEvent {
  final String inviteCode;

  AddFriendEvent(this.inviteCode);
}

class GetAllFriendsEvent extends HomeEvent {
  GetAllFriendsEvent();
}
