
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mon_marche_domestique/features/auth/data/model/user_model.dart';
import 'package:mon_marche_domestique/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  
  @override
  Stream<User?> get authStateChanges => FirebaseAuth.instance.authStateChanges();

  @override
  Future<UserModel> signUp({required String email, required String password}) async{
    final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel.fromFirebase(userCredential.user!);
  }

  @override
  Future<UserModel> signIn({required String email, required String password}) async{
    final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel.fromFirebase(userCredential.user!);
  }

  @override
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
