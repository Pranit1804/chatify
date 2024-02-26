// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

abstract class ChatState {
  const ChatState();
}

class ChatInitialState extends ChatState {}

class SendMessageSuccess extends ChatState {}

class GetAllChatsSuccess extends ChatState {
  final List<ChatModel> chats;

  GetAllChatsSuccess(this.chats);
}
