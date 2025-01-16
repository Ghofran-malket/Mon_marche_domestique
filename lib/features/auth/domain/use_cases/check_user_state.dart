// lib/domain/usecases/add_item.dart
import 'package:mon_marche_domestique/features/auth/domain/repository/auth_repository.dart';

class CheckUserState  {
  final AuthRepository repository;

  CheckUserState(this.repository);

  Future<void> call() async {
    repository.authStateChange();
  }
}
