import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipe_app/core/Utils.dart';

abstract class AuthenticationService {
  Stream<User?> get authState;

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<void> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String username});

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
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
      // print('Exc mes: ${e.message} and code ${e.code} ${e.credential}');
    }
  }

  @override
  Future<void> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String username}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firebaseAuth.currentUser?.updateDisplayName(username);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar('${e.message} + ${e.code}');
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
