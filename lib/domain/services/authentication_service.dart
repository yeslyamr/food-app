import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationService {
  Stream<User?> get authState;

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password});

  Future<void> signOut();
}

class FirebaseAuthenticationService implements AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthenticationService(this._firebaseAuth);

  @override
  Stream<User?> get authState => _firebaseAuth.authStateChanges();

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Future<String> signInWithGoogle() {
  //
  // }
}
