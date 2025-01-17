import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  void authStateChange();
  
  Future<User> signUp({required String email, required String password});
}
