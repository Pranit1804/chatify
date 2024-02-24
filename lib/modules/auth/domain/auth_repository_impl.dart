import 'package:chatify/modules/auth/data/auth_local_data_source.dart';
import 'package:chatify/modules/auth/data/auth_remote_data_source.dart';
import 'package:chatify/modules/auth/data/auth_repository.dart';
import 'package:chatify/modules/auth/data/models/user_request_model.dart';
import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource, this._authLocalDataSource);
  @override
  Future<UserCredential> signupUser(UserRequestModel userRequestModel) {
    return _authRemoteDataSource.signupUser(userRequestModel);
  }

  @override
  Future<void> createUser(UserEntity user) async {
    await _authRemoteDataSource.createUser(user);
    _authLocalDataSource.storeUserEntity(user);
  }

  @override
  Future<UserEntity> login(UserRequestModel userRequestModel) async {
    UserEntity user = await _authRemoteDataSource.login(userRequestModel);
    _authLocalDataSource.storeUserEntity(user);
    return user;
  }
}
