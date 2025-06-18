import 'package:auvnet_internship_assessment/feature/auth/domain/entity/user_entity.dart';
import 'package:hive/hive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AuthRemoteDataSource {
  Future<void> signUp(UserEntity user);

  Future<void> signIn(UserEntity user);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl(this.auth, this.firestore);

  @override
  Future<void> signUp(UserEntity user) async {
    final UserCredential userCredential = await auth
        .createUserWithEmailAndPassword(
          email: user.email,
          password: user.password,
        );
    final userId = userCredential.user?.uid;
    if (userId != null && user.name != null) {
      await firestore.collection('users').doc(userId).set({
        'id': userId,
        'name': user.name,
        'email': user.email,
      });
    }
  }

  @override
  Future<void> signIn(UserEntity user) async {
    final UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
    final userId = userCredential.user?.uid;
    if (userId != null) {
      final box = await Hive.openBox('authBox');
      await box.put('userId', userId);
    }
  }
}
