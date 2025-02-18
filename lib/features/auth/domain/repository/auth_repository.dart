import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mon_marche_domestique/features/auth/data/model/user_model.dart';

abstract class AuthRepository {
  Stream<User?> get authStateChanges;
  Future<UserModel> signUp({required String email, required String password});
  Future<UserModel> signIn({required String email, required String password});
  Future<void> logOut();
  Future<UserModel?> signInWithGoogle();
}
