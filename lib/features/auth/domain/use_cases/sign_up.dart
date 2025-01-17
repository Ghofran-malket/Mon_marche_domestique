import 'package:firebase_auth/firebase_auth.dart';
import 'package:mon_marche_domestique/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignUp {
  final AuthRepository repository;

  SignUp(this.repository);

  Future<Either<String, User>> call(email,password) async {
    try {
      final user = await repository.signUp(email:email, password: password);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left('Password should be at least 6 characters long.');
      } else if (e.code == 'email-already-in-use') {
        return Left('The email is already in use.');
      } else if(e.code == 'invalid-email'){
        return Left('The email is not valid.');
      } else {
        return Left('An unexpected error occurred. Please try again.');
      }
    }
  }
}
