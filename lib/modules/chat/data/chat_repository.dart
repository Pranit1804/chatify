import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:chatify/modules/chat/data/models/chat_model.dart';

abstract class ChatRepository {
  Future<void> getAllMessages(UserEntity user, UserEntity friend);
  Future<void> sendMessage(
      ChatModel message, UserEntity user, UserEntity friend);
}
