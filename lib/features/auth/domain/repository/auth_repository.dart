import 'dart:async';
import 'package:mon_marche_domestique/features/auth/data/model/user_model.dart';

abstract class AuthRepository {
  void authStateChange();
  
  Future<UserModel> signUp({required String email, required String password});
  Future<UserModel> signIn({required String email, required String password});
}
