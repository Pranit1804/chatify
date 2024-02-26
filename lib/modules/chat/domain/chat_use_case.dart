import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:chatify/modules/chat/data/chat_repository.dart';
import 'package:chatify/modules/chat/data/models/chat_model.dart';

class ChatUseCase {
  final ChatRepository _chatRepository;

  ChatUseCase(this._chatRepository);

  Future<void> getAllMessages(UserEntity user, UserEntity friend) async {
    await _chatRepository.getAllMessages(user, friend);
  }

  Future<void> sendMessage(
      ChatModel message, UserEntity user, UserEntity friend) async {
    _chatRepository.sendMessage(message, user, friend);
  }
}
