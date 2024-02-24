import 'package:chatify/modules/auth/data/models/user_request_model.dart';
import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential> signupUser(UserRequestModel userRequestModel);
  Future<void> createUser(UserEntity user);
  Future<UserEntity> login(UserRequestModel userRequestModel);
}
