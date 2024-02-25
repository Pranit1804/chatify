import 'package:chatify/modules/auth/domain/entities/user_entity.dart';

abstract class HomeRepository {
  Future<UserEntity?> getUserByInviteCode(String inviteCode);
  Future<void> addFriend(String userId, UserEntity user);
  Future<List<UserEntity>> getAllFriends(String userId);
}
