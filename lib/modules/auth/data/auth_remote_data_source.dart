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
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userRequestModel.email,
      password: userRequestModel.password,
    );

    return userCredential;
  }

  Future<void> createUser(UserEntity user) async {
    await _users.doc(user.userId).set(user);
  }

  Future<UserEntity> login(UserRequestModel requestModel) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: requestModel.email, password: requestModel.password);

    DocumentSnapshot<Object?> ref =
        await _users.doc(credential.user!.uid).get();

    return ref.data() as UserEntity;
  }
}
