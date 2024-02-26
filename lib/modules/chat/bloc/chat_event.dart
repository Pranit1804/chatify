part of 'chat_bloc.dart';

abstract class ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final UserEntity reciever;
  final String message;

  SendMessageEvent({required this.reciever, required this.message});
}

class GetAllChatsEvent extends ChatEvent {
  final UserEntity reciever;

  GetAllChatsEvent({required this.reciever});
}
