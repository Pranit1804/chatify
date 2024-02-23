import 'package:chatify/modules/auth/data/auth_remote_data_source.dart';
import 'package:chatify/modules/auth/data/auth_repository.dart';
import 'package:chatify/modules/auth/data/models/user_request_model.dart';
import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);
  @override
  Future<UserCredential> signupUser(UserRequestModel userRequestModel) {
    return _authRemoteDataSource.signupUser(userRequestModel);
  }

  @override
  Future<UserEntity> createUser(UserCredential userCredential) {
    return _authRemoteDataSource.createUser(userCredential);
  }
}
