import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/application/navigation/auto_router.dart';
import 'package:recipe_app/application/stores/auth/auth_store.dart';
import 'package:recipe_app/application/stores/favourite_recipes_store.dart';
import 'package:recipe_app/core/Utils.dart';
import 'package:recipe_app/domain/services/authentication_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter(authGuard: AuthGuard());
  final favouriteStore = FavouriteRecipesStore();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthStore>(
          create: (context) =>
              AuthStore(FirebaseAuthenticationService(FirebaseAuth.instance)),
        ),
        Provider.value(
          value: favouriteStore,
        ),
      ],
      child: MaterialApp.router(
        scaffoldMessengerKey: Utils.messengerKey,
        title: 'Food app',
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(158, 178, 59, 1),
          ),
        ),
      ),
    );
  }
}
