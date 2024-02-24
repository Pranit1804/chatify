import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:chatify/objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  static const String dbName = 'chatify-objectbox_v1';
  late final Store store;

  static late final Box<UserEntity> _userEntityBox;

  static Future<ObjectBox> create(
      {String? directoryPath, String? macOSGroup}) async {
    final docsDir = await getApplicationDocumentsDirectory();
    try {
      if (Store.isOpen(p.join(docsDir.path, dbName))) {
        final store =
            Store.attach(getObjectBoxModel(), p.join(docsDir.path, dbName));
        return ObjectBox._create(store);
      } else {
        final store = await openStore(directory: p.join(docsDir.path, dbName));
        return ObjectBox._create(store);
      }
    } catch (e) {
      final store = await openStore(directory: p.join(docsDir.path, dbName));
      return ObjectBox._create(store);
    }
  }

  ObjectBox._create(this.store) {
    _userEntityBox = Box<UserEntity>(store);
  }

  static Box<UserEntity> getUserEntity() => _userEntityBox;
}
