import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:chatify/modules/home/data/home_repository.dart';

class HomeUseCase {
  final HomeRepository _homeRepository;

  HomeUseCase(this._homeRepository);

  Future<UserEntity?> getUserByInviteCode(String inviteCode) {
    return _homeRepository.getUserByInviteCode(inviteCode);
  }

  Future<void> addFriend(UserEntity user, UserEntity friend) async {
    _homeRepository.addFriend(user, friend);
  }

  Future<List<UserEntity>> getAllFriends(String userId) async {
    return await _homeRepository.getAllFriends(userId);
  }
}
