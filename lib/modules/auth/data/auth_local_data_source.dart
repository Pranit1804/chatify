import 'package:chatify/local_database/object_box.dart';
import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:objectbox/objectbox.dart';

class AuthLocalDataSource {
  void storeUserEntity(UserEntity user) {
    Box<UserEntity> userBox = ObjectBox.getUserEntity();
    userBox.removeAll();
    userBox.put(user);
  }

  UserEntity? getUserEntity() {
    List<UserEntity> users = ObjectBox.getUserEntity().getAll();
    return users.isNotEmpty ? ObjectBox.getUserEntity().getAll()[0] : null;
  }
}
