import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/application/stores/auth/auth_store.dart';
import 'package:recipe_app/main.dart';

class EmailVerificationWrapper extends StatefulWidget {
  const EmailVerificationWrapper({Key? key}) : super(key: key);

  @override
  State<EmailVerificationWrapper> createState() =>
      _EmailVerificationWrapperState();
}

class _EmailVerificationWrapperState extends State<EmailVerificationWrapper> {
  bool _isEmailVerified = false;
  Timer? timer;

  bool canResendEmail = true;

  @override
  void initState() {
    super.initState();
    _isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!_isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
          const Duration(seconds: 3), (_) => checkIfEmailVerified());
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> checkIfEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      _isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (_isEmailVerified) timer?.cancel();
  }

  Future<void> sendVerificationEmail() async {
    final authStore = Provider.of<AuthStore>(context, listen: false);
    authStore.sendEmailVerification();
    setState(() => canResendEmail = false);

    await Future.delayed(const Duration(seconds: 5));
    setState(() => canResendEmail = true);
  }

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);
    return _isEmailVerified
        ? const HomePage()
        : Scaffold(
            appBar: AppBar(
              title: const Text('Email verification'),
              leading: IconButton(
                  onPressed: () => authStore.signOut(),
                  icon: const Icon(Icons.arrow_back)),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('You need to verify your email address'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: canResendEmail ? sendVerificationEmail : null,
                      child: const Text('Send verification email again'))
                ],
              ),
            ),
          );
  }
}
