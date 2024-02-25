import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:chatify/modules/home/data/home_local_data_source.dart';
import 'package:chatify/modules/home/data/home_remote_data_source.dart';
import 'package:chatify/modules/home/data/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final HomeLocalDataSource _homeLocalDataSource;

  HomeRepositoryImpl(this._homeRemoteDataSource, this._homeLocalDataSource);

  @override
  Future<UserEntity?> getUserByInviteCode(String inviteCode) {
    return _homeRemoteDataSource.getUserByInviteCode(inviteCode);
  }

  @override
  Future<void> addFriend(String userId, UserEntity user) async {
    await _homeRemoteDataSource.addFriend(userId, user);
  }

  @override
  Future<List<UserEntity>> getAllFriends(String userId) {
    return _homeRemoteDataSource.getAllFriends(userId);
  }
}
