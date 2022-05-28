import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/application/pages/auth/auth_page.dart';
import 'package:recipe_app/application/stores/auth/auth_store.dart';
import 'package:recipe_app/core/Utils.dart';
import 'package:recipe_app/domain/services/authentication_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthStore>(
          create: (context) =>
              AuthStore(FirebaseAuthenticationService(FirebaseAuth.instance)),
        )
      ],
      child: MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        title: 'Food app',
        home: const AuthenticationWrapper(),
        // routes: ,
      ),
    );
  }
}

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
              return const HomePage();
            } else {
              return const AuthPage();
            }
          }),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Home page')),
      body: Center(
        child: Column(
          children: [
            Text(FirebaseAuth.instance.currentUser?.displayName ??
                'no disp name'),
            Text(FirebaseAuth.instance.currentUser?.email ?? 'no email'),
            ElevatedButton(
                onPressed: () => authStore.signOut(),
                child: const Text('Sign Out')),
          ],
        ),
      ),
    );
  }
}
