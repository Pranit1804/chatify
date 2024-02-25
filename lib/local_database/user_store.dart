import 'package:chatify/modules/auth/data/auth_local_data_source.dart';
import 'package:chatify/modules/auth/domain/entities/user_entity.dart';

class UserStore {
  static final AuthLocalDataSource _authLocalDataSource = AuthLocalDataSource();
  UserStore._();

  static UserEntity? getUser() {
    return _authLocalDataSource.getUserEntity();
  }

  static String? getUserId() {
    return _authLocalDataSource.getUserEntity()?.userId;
  }
}
