import 'package:chatify/common/utils/app_utils.dart';
import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:chatify/modules/chat/data/models/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRemoteDataSource {
  final String userCollection = 'users';
  final String chatsCollection = 'chats';
  late CollectionReference _users;
  ChatRemoteDataSource() {
    _users = FirebaseFirestore.instance
        .collection(userCollection)
        .withConverter<UserEntity>(
            fromFirestore: (snap, _) => UserEntity.fromJson(snap.data()!),
            toFirestore: (user, _) => user.toJson());
  }

  Future<void> getAllMessages(UserEntity user, UserEntity friend) async {
    FirebaseFirestore.instance
        .collection(
            '$chatsCollection/${AppUtils.getConversationID(user, friend.userId)}/messages/')
        .snapshots();
  }

  Future<void> sendMessage(
      ChatModel message, UserEntity user, UserEntity friend) async {
    final ref = FirebaseFirestore.instance.collection(
        '$chatsCollection/${AppUtils.getConversationID(user, friend.userId)}/messages/');
    ref.doc().set(message.toJson());
  }
}
