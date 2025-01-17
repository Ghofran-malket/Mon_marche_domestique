
abstract class AuthState {}

class AuthLoadingState extends AuthState {}

class AuthStateChangeState extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure(this.errorMessage);
}
