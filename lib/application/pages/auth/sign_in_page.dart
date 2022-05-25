import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:recipe_app/application/stores/auth/sign_in_form.dart/sign_in_form_store.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final SignInFormStore store = SignInFormStore();
  var isPasswordObscure = false;

  @override
  void initState() {
    super.initState();
    store.setupValidations();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign in")),
      body: Center(
          child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) => TextField(
                onChanged: (value) => store.emailAddress = value,
                decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email address',
                    errorText: store.error.email),
              ),
            ),
            const SizedBox(height: 10),
            Observer(
              builder: (_) => TextField(
                obscureText: isPasswordObscure,
                onChanged: (value) => store.password = value,
                decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () => setState(() {
                              isPasswordObscure = !isPasswordObscure;
                            }),
                        icon: isPasswordObscure
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                    errorText: store.error.password),
              ),
            ),
            const SizedBox(height: 10),
            Observer(
              builder: (_) => ElevatedButton(
                onPressed: store.canLogin ? () {} : null,
                child: const Text("Sign in"),
              ),
            ),
            const SizedBox(height: 10),
            Observer(
              builder: (_) => ElevatedButton(
                onPressed: store.canLogin ? () {} : null,
                child: const Text("Sign in with google"),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
