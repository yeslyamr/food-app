import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/application/pages/auth/sign_in_page.dart';
import 'package:recipe_app/application/stores/auth/auth_store.dart';
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
      child: const MaterialApp(
        title: 'Food app',
        home: SplashPage(),
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);

    return Scaffold(
      body: StreamBuilder<User?>(
          stream: authStore.authStateStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const SignInPage();
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
        child: ElevatedButton(
            onPressed: () => authStore.signOut(),
            child: const Text('Sign Out')),
      ),
    );
  }
}
