import 'package:firebase_auth/firebase_auth.dart';
import 'package:mon_marche_domestique/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required String uid, required String email, required String displayName})
  : super(uid: uid, email: email, displayName: displayName);

  factory UserModel.fromFirebase(User user){
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName ?? '',
    );
  }
}