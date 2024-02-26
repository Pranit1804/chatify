import 'package:chatify/modules/auth/domain/entities/user_entity.dart';

abstract class HomeRepository {
  Future<UserEntity?> getUserByInviteCode(String inviteCode);
  Future<void> addFriend(UserEntity user, UserEntity friend);
  Future<List<UserEntity>> getAllFriends(String userId);
}
