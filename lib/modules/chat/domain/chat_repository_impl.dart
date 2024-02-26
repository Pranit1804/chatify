import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:chatify/modules/chat/data/chat_local_data_source.dart';
import 'package:chatify/modules/chat/data/chat_remote_data_source.dart';
import 'package:chatify/modules/chat/data/chat_repository.dart';
import 'package:chatify/modules/chat/data/models/chat_model.dart';

class ChatRepositoryImpl extends ChatRepository {
  final ChatRemoteDataSource _chatRemoteDataSource;
  final ChatLocalDataSource _chatLocalDataSource;

  ChatRepositoryImpl(this._chatRemoteDataSource, this._chatLocalDataSource);

  @override
  Future<void> getAllMessages(UserEntity user, UserEntity friend) async {
    await _chatRemoteDataSource.getAllMessages(user, friend);
  }

  @override
  Future<void> sendMessage(
      ChatModel message, UserEntity user, UserEntity friend) async {
    await _chatRemoteDataSource.sendMessage(message, user, friend);
  }
}
