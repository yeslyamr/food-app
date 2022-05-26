import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/application/stores/auth/auth_store.dart';
import 'package:recipe_app/application/stores/auth/sign_in_form.dart/sign_in_form_store.dart';

class SignInPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const SignInPage({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final SignInFormStore formStore = SignInFormStore();

  var isPasswordObscure = false;

  @override
  void initState() {
    super.initState();
    formStore.setupValidations();
  }

  @override
  void dispose() {
    formStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Sign in")),
      body: Center(
          child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) => TextField(
                onChanged: (value) => formStore.emailAddress = value.trim(),
                decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email address',
                    errorText: formStore.error.email),
              ),
            ),
            const SizedBox(height: 10),
            Observer(
              builder: (_) => TextField(
                obscureText: isPasswordObscure,
                onChanged: (value) => formStore.password = value.trim(),
                decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () => setState(() {
                              isPasswordObscure = !isPasswordObscure;
                            }),
                        icon: isPasswordObscure
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                    errorText: formStore.error.password),
              ),
            ),
            const SizedBox(height: 10),
            Observer(
              builder: (_) => ElevatedButton(
                onPressed: formStore.canLogin
                    ? () => authStore.signInWithEmailAndPassword(
                        email: formStore.emailAddress,
                        password: formStore.password)
                    : null,
                child: const Text("Sign in"),
              ),
            ),
            const SizedBox(height: 10),
            Observer(
              builder: (_) => ElevatedButton(
                onPressed:  widget.onClickedSignUp,
                child: const Text("Go to Sign up page"),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
