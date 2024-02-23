import 'package:chatify/modules/auth/data/auth_repository.dart';
import 'package:chatify/modules/auth/data/models/user_request_model.dart';
import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<UserEntity> signupUser(UserRequestModel userRequestModel) async {
    UserCredential userCredential =
        await _authRepository.signupUser(userRequestModel);
    return await createUser(userCredential);
  }

  Future<UserEntity> createUser(UserCredential userCredential) {
    return _authRepository.createUser(userCredential);
  }
}
