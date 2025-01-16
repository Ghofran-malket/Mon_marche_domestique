
abstract class AuthRepository {
  void authStateChange();
  
  void signUp({required String email, required String password});
}
