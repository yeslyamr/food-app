
import 'package:flutter/material.dart';
import 'package:recipe_app/application/pages/auth/sign_in_page.dart';
import 'package:recipe_app/application/pages/auth/sign_up_page.dart';

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
