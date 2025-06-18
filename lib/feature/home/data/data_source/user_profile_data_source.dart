import 'package:auvnet_internship_assessment/feature/home/domain/entity/user_profile_entity.dart';
import 'package:hive/hive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserProfileRemoteDataSource {
  Future<UserProfileEntity> getUserProfile(String userId);
}

abstract class UserProfileLocalDataSource {
  Future<void> cacheUserProfile(UserProfileEntity userProfile);
  Future<UserProfileEntity?> getCachedUserProfile();
}

class UserProfileRemoteDataSourceImpl implements UserProfileRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  UserProfileRemoteDataSourceImpl(this.auth, this.firestore);

  @override
  Future<UserProfileEntity> getUserProfile(String userId) async {
    final userDoc = await firestore.collection('users').doc(userId).get();

    if (!userDoc.exists) {
      throw Exception("User profile not found");
    }

    return UserProfileEntity(
      id: userDoc.id,
      name: userDoc.data()!['name'],
      email: userDoc.data()!['email'],
    );
  }
}

class UserProfileLocalDataSourceImpl implements UserProfileLocalDataSource {
  final Box box;

  UserProfileLocalDataSourceImpl(this.box);

  @override
  Future<void> cacheUserProfile(UserProfileEntity userProfile) async {
    await box.put('userProfile', {
      'id': userProfile.id,
      'name': userProfile.name,
      'email': userProfile.email,
    });
  }

  @override
  Future<UserProfileEntity?> getCachedUserProfile() async {
    final data = box.get('userProfile');
    if (data == null) return null;

    return UserProfileEntity(
      id: data['id'],
      name: data['name'],
      email: data['email'],
    );
  }
}
