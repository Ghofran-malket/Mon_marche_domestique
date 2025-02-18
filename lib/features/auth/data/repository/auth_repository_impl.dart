
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mon_marche_domestique/features/auth/data/model/user_model.dart';
import 'package:mon_marche_domestique/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  @override
  Stream<User?> get authStateChanges => FirebaseAuth.instance.authStateChanges();

  @override
  Future<UserModel> signUp({required String email, required String password}) async{
    final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel.fromFirebase(userCredential.user!);
  }

  @override
  Future<UserModel> signIn({required String email, required String password}) async{
    final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel.fromFirebase(userCredential.user!);
  }

  @override
  Future<void> logOut() async {
    await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<UserModel?> signInWithGoogle() async {
    try {
      // Trigger Google Sign-In
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null; // User canceled the sign-in
      }

      // Get authentication details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential for Firebase
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      return UserModel.fromFirebase(user!);
    } catch (e) {
      print("Error during Google sign-in: $e");
      return null;
    }
  }

  // sdsd (){
  //   _googleSignIn.onCurrentUserChanged.listen((account) {
  //     _user = account == null ? null : _auth.currentUser;
      
  //   });
  //   _googleSignIn.signInSilently(); 
  // }

}
