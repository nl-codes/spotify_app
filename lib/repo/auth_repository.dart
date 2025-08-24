import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  }

  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Stream<User?> get userChanges => _firebaseAuth.authStateChanges();
}
