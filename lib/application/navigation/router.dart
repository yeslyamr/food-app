import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/application/navigation/route_utils.dart';
import 'package:recipe_app/application/pages/auth/email_verification_page.dart';
import 'package:recipe_app/application/pages/auth/password_reset_page.dart';
import 'package:recipe_app/application/pages/auth/sign_in_page.dart';
import 'package:recipe_app/application/pages/auth/sign_up_page.dart';
import 'package:recipe_app/main.dart';

class MyRouter {
  MyRouter();

  late final _router = GoRouter(
    redirect: (GoRouterState state) {
      // takes current user if signed in or null otherwise
      final User? currentUser = FirebaseAuth.instance.currentUser;

      // checks if user is signed in
      final bool isLoggedIn = currentUser != null;

      // checks if user verified the email
      final bool isEmailVerified = currentUser?.emailVerified ?? false;

      // checks if user is already in process of signing in\up
      final loggingIn = state.subloc == AppRoutes.signInPage.path ||
          state.subloc == AppRoutes.passwordResetPage.path ||
          state.subloc == AppRoutes.signUpPage.path;

      // checks if user is already in process of email verification
      final isVerifying = state.subloc == AppRoutes.emailVerificationPage.path;

      // if user is not signed in and not currently signing in then router sends user to signInPage
      if (!isLoggedIn) return loggingIn ? null : AppRoutes.signInPage.path;

      // if user is not verified and not currently in proccess of verification then router sends user to emailVerificationPage
      if (!isEmailVerified) {
        return isVerifying ? null : AppRoutes.emailVerificationPage.path;
      }

      // if user somehow logged in and verified and still on loggingIn pages or on verification page gorouter sends user to main page of the app
      if (loggingIn || isVerifying) return AppRoutes.main.path;

      // other returns null
      return null;
    },
    refreshListenable:
        GoRouterRefreshStream(FirebaseAuth.instance.userChanges()),
    errorPageBuilder: (context, state) {
      return MaterialPage(
          child: Scaffold(
        appBar: AppBar(
          title: const Text('Error page'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(FirebaseAuth.instance.currentUser?.email ?? 'no user'),
              Text(
                  FirebaseAuth.instance.currentUser?.emailVerified.toString() ??
                      'no user'),
              Text(FirebaseAuth.instance.currentUser?.toString() ?? 'no user'),
              ElevatedButton(
                  onPressed: () => FirebaseAuth.instance.signOut(),
                  child: const Text('sign out'))
            ],
          ),
        ),
      ));
    },
    routes: [
      GoRoute(
        path: AppRoutes.signInPage.path,
        name: AppRoutes.signInPage.name,
        builder: (BuildContext context, GoRouterState state) =>
            const SignInPage(),
      ),
      GoRoute(
        path: AppRoutes.signUpPage.path,
        name: AppRoutes.signUpPage.name,
        builder: (BuildContext context, GoRouterState state) =>
            const SignUpPage(),
      ),
      GoRoute(
        path: AppRoutes.passwordResetPage.path,
        name: AppRoutes.passwordResetPage.name,
        builder: (BuildContext context, GoRouterState state) =>
            const PasswordResetPage(),
      ),
      GoRoute(
        path: AppRoutes.emailVerificationPage.path,
        name: AppRoutes.emailVerificationPage.name,
        builder: (BuildContext context, GoRouterState state) =>
            const EmailVerificationPage(),
      ),
      GoRoute(
        path: AppRoutes.main.path,
        name: AppRoutes.main.name,
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage(),
      ),
    ],
  );

  GoRouter get router => _router;
}
