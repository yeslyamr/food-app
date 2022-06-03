enum AppRoutes {
  signInPage('/login', 'Sign In Page'),
  signUpPage('/register', 'Sign Up Page'),
  passwordResetPage('/passwordreset', 'Password Reset Page'),
  emailVerificationPage('/emailverification', 'Email Verification Page'),
  main('/', 'Main Screen Page');

  final String path;
  final String name;

  const AppRoutes(this.path, this.name);

  @override
  String toString() {
    return 'Name of the goRoute: $name, path: $path';
  }
}
