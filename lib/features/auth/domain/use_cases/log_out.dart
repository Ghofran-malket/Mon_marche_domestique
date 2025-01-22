import 'package:mon_marche_domestique/features/auth/domain/repository/auth_repository.dart';

class LogOut {
  final AuthRepository repository;

  LogOut(this.repository);

  Future<void> call() async {
    await repository.logOut();
  }
}
