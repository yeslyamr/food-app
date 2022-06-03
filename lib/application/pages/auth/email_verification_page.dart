import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/application/navigation/route_utils.dart';
import 'package:recipe_app/application/stores/auth/auth_store.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({Key? key}) : super(key: key);

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  bool canResendEmail = true;
  Timer? timer;

  @override
  void initState() {
    sendVerificationEmail();
    timer = Timer.periodic(
        const Duration(seconds: 3), (_) => checkIfEmailVerified());
    super.initState();
  }

  Future<void> checkIfEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    bool isVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (isVerified) {
      timer?.cancel();
      if (!mounted) return;
      context.goNamed(AppRoutes.main.name);
    }
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Email verification'),
        leading: IconButton(
            onPressed: () async => authStore.signOut(),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You need to verify your email address'),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed:
                    canResendEmail ? () => sendVerificationEmail() : null,
                child: const Text('Send verification email again')),
          ],
        ),
      ),
    );
  }
}
