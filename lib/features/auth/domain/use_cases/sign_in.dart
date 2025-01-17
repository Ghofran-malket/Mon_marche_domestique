import 'package:firebase_auth/firebase_auth.dart';
import 'package:mon_marche_domestique/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignIn {
  final AuthRepository repository;

  SignIn(this.repository);

  Future<Either<String, User>> call(email,password) async {
    try {
      final user = await repository.signIn(email:email, password: password);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        return Left('The password is invalid for the given email');
      } else if (e.code == 'invalid-email') {
        return Left('The email address is not valid..');
      } else if(e.code == 'user-disabled'){
        return Left('The user corresponding to the given email has been disabled.');
      } else if(e.code == 'user-not-found'){
        return Left('There is no user corresponding to the given email.');
      } else {
        return Left('An unexpected error occurred. Please try again.');
      }
    }
  }
}
