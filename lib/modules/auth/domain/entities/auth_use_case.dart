import 'package:chatify/common/utils/app_utils.dart';
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
    UserEntity user = UserEntity(
      userCredential.user!.uid,
      userRequestModel.username!,
      userRequestModel.email,
      AppUtils.getRandomString(5),
    );
    await createUser(user);
    return user;
  }

  Future<void> createUser(UserEntity user) {
    return _authRepository.createUser(user);
  }

  Future<UserEntity> login(UserRequestModel userRequestModel) {
    return _authRepository.login(userRequestModel);
  }
}
