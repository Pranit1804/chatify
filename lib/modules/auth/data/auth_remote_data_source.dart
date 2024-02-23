import 'package:chatify/modules/auth/data/models/user_request_model.dart';
import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  final String userCollection = 'users';
  late CollectionReference _users;
  AuthRemoteDataSource() {
    _users = FirebaseFirestore.instance
        .collection(userCollection)
        .withConverter<UserEntity>(
            fromFirestore: (snap, _) => UserEntity.fromJson(snap.data()!),
            toFirestore: (user, _) => user.toJson());
  }

  Future<UserCredential> signupUser(UserRequestModel userRequestModel) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userRequestModel.email,
      password: userRequestModel.password,
    );
  }

  Future<UserEntity> createUser(UserCredential userCredential) async {
    _users.add(UserEntity(
      id: userCredential.user!.uid,
      username: 'Pranit',
      inviteCode: "as134a",
    ));
    return UserEntity(id: "123", username: "asdaf", inviteCode: "213123");
  }
}
