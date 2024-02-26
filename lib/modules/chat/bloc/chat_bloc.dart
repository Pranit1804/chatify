// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatify/local_database/user_store.dart';
import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:chatify/modules/chat/data/models/chat_model.dart';
import 'package:chatify/modules/chat/domain/chat_use_case.dart';
import 'package:chatify/modules/snackbar/bloc/snackbar_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatUseCase _chatUseCase;
  final SnackbarBloc _snackbarBloc;
  ChatBloc({
    required ChatUseCase chatUseCase,
    required SnackbarBloc snackbarBloc,
  })  : _chatUseCase = chatUseCase,
        _snackbarBloc = snackbarBloc,
        super(ChatInitialState()) {
    on<SendMessageEvent>(_onSendMessageEvent);
    on<GetAllChatsEvent>(_onGetAllChatsEvent);
  }

  void _onSendMessageEvent(SendMessageEvent event, Emitter emit) {
    try {
      UserEntity user = UserStore.getUser()!;
      ChatModel message = ChatModel(
        recieverId: event.reciever.userId,
        message: event.message,
        read: "",
        senderId: user.userId,
        createdAt: DateTime.now(),
      );
      _chatUseCase.sendMessage(message, user, event.reciever);
    } catch (e) {
      _snackbarBloc.add(ShowSnackbarEvent.forSomethingWentWrong());
    }
  }

  void _onGetAllChatsEvent(GetAllChatsEvent event, Emitter emit) {}
}
