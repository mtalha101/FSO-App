import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser!;

  Stream<User?> get authStateChange => _auth.authStateChanges();

  void signInWithEmailPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      return;
    }
  }

  Future<UserCredential?> signUpWithEmailPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      return null;
    }
  }
}
