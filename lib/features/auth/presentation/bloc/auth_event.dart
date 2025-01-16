
abstract class AuthEvent {}

class AuthStateChangeEvent extends AuthEvent {}

class SignUpEvent extends AuthEvent{
  final String email;
  final String password;
  SignUpEvent({required this.email, required this.password});
}