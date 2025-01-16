// lib/domain/usecases/add_item.dart
import 'package:mon_marche_domestique/features/auth/domain/repository/auth_repository.dart';

class SignUp {
  final AuthRepository repository;

  SignUp(this.repository);

  Future<void> call(email,password) async {
    repository.signUp(email: email, password: password);
  }
}
