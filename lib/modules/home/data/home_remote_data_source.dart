import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRemoteDataSource {
  final String userCollection = 'users';
  final String friendsCollection = 'friends';
  late CollectionReference _users;
  late CollectionReference _friends;

  HomeRemoteDataSource() {
    _users = FirebaseFirestore.instance
        .collection(userCollection)
        .withConverter<UserEntity>(
            fromFirestore: (snap, _) => UserEntity.fromJson(snap.data()!),
            toFirestore: (user, _) => user.toJson());
    _friends = FirebaseFirestore.instance
        .collection(friendsCollection)
        .withConverter<UserEntity>(
            fromFirestore: (snap, _) => UserEntity.fromJson(snap.data()!),
            toFirestore: (user, _) => user.toJson());
  }

  Future<UserEntity?> getUserByInviteCode(String inviteCode) async {
    final data = await _users.where('inviteCode', isEqualTo: inviteCode).get();
    return data.docs.isNotEmpty ? data.docs[0].data() as UserEntity : null;
  }

  Future<List<UserEntity>> getAllFriends(String userId) async {
    final List<UserEntity> friends = [];
    final doc = _friends.doc(userId).collection(userId);
    final data = await doc.get();
    for (var friend in data.docs) {
      friends.add(UserEntity.fromJson(friend.data()));
    }
    return friends;
  }

  Future<void> addFriend(UserEntity user, UserEntity friend) async {
    await _friends
        .doc(user.userId)
        .collection(user.userId)
        .doc(friend.userId)
        .set(friend.toJson());

    await _friends
        .doc(friend.userId)
        .collection(friend.userId)
        .doc(user.userId)
        .set(user.toJson());
  }
}
