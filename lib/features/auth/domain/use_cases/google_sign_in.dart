import 'package:mon_marche_domestique/features/auth/data/model/user_model.dart';
import 'package:mon_marche_domestique/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class GoogleSignIn {
  final AuthRepository repository;

  GoogleSignIn(this.repository);

  Future<Either<String, UserModel>> call() async {
    try {
      final user = await repository.signInWithGoogle();
      return Right(user!);
    }catch (e) {
      return Left('Error during Google sign-in: $e');
    }
  }
}
