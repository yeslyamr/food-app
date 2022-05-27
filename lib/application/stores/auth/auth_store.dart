// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:recipe_app/domain/services/authentication_service.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final AuthenticationService authService;

  _AuthStore(this.authService);

  late final ObservableStream<User?> authStateStream =
      ObservableStream(authService.authState);

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await authService.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password, required String username}) async {
    await authService.signUpWithEmailAndPassword(email: email, password: password, username: username);
  }

  Future<void> signOut() async {
    await authService.signOut();
  }
}
