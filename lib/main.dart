import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/application/navigation/router.dart';
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
        ),
        ProxyProvider<AuthStore, MyRouter>(
          update: (_, authStore, __) => MyRouter(authStore),
        )
      ],
      child: Builder(builder: (context) {
        final myRouter = Provider.of<MyRouter>(context, listen: false).router;
        return MaterialApp.router(
          scaffoldMessengerKey: Utils.messengerKey,
          title: 'Food app',
          routeInformationParser: myRouter.routeInformationParser,
          routerDelegate: myRouter.routerDelegate,
          // home: const AuthenticationWrapper(),
        );
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
        child: Observer(builder: (_) {
          return Column(
            children: [
              Text(FirebaseAuth.instance.currentUser?.displayName ??
                  'no disp name'),
              Text(FirebaseAuth.instance.currentUser?.email ?? 'no email'),
              Text(FirebaseAuth.instance.currentUser?.emailVerified.toString() ?? 'no email'),
              ElevatedButton(
                  onPressed: () => authStore.signOut(),
                  child: const Text('Sign Out')),
            ],
          );
        }),
      ),
    );
  }
}
