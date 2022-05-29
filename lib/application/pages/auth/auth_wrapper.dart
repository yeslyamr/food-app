import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/application/pages/auth/email_verification_wrapper.dart';
import 'package:recipe_app/application/pages/auth/sign_in_page.dart';
import 'package:recipe_app/application/pages/auth/sign_up_page.dart';
import 'package:recipe_app/application/stores/auth/auth_store.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);

    return Scaffold(
      body: StreamBuilder<User?>(
          stream: authStore.authStateStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return const EmailVerificationWrapper();
            } else {
              return const AuthPage();
            }
          }),
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isSignUpPage = false;

  @override
  Widget build(BuildContext context) {
    return isSignUpPage
        ? SignUpPage(onClickedSignIn: toggle)
        : SignInPage(onClickedSignUp: toggle);
  }

  void toggle() => setState(() => isSignUpPage = !isSignUpPage);
}
