
import 'package:mon_marche_domestique/features/auth/domain/entities/user_entity.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthStateChangeState extends AuthState {}

class AuthSuccess extends AuthState {
  final UserEntity user;
  AuthSuccess({required this.user});
}

class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure(this.errorMessage);
}
