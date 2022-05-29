import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/application/stores/auth/auth_store.dart';
import 'package:recipe_app/core/Utils.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({Key? key}) : super(key: key);

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset password'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 25.0, right: 20, bottom: 10),
                child: Text(
                  'Receive an email to reset your password',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 10),
              _EmailAddressTextField(controller: _controller),
              const SizedBox(height: 20),
              _ResetPasswordButton(
                  authStore: authStore,
                  controller: _controller,
                  mounted: mounted)
            ],
          )
        ],
      ),
    );
  }
}

class _ResetPasswordButton extends StatelessWidget {
  const _ResetPasswordButton({
    Key? key,
    required this.authStore,
    required TextEditingController controller,
    required this.mounted,
  })  : _controller = controller,
        super(key: key);

  final AuthStore authStore;
  final TextEditingController _controller;
  final bool mounted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          )),
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 50)),
        ),
        onPressed: () async {
          bool isSend = true;
          try {
            await authStore.resetPassword(
                email: _controller.text.trim().toLowerCase());
          } on FirebaseAuthException catch (e) {
            isSend = false;
            Utils.showSnackBar(e.message, backgroundColor: Colors.red);
          }
          if (!mounted) return;
          if (isSend) {
            Utils.showSnackBar('Password reset email sent',
                backgroundColor: Colors.green);
            Navigator.of(context).pop();
          }
        },
        child: const Text("Reset password"),
      ),
    );
  }
}

class _EmailAddressTextField extends StatelessWidget {
  const _EmailAddressTextField({
    Key? key,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
          validator: (email) {
            const emailRegExp =
                r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
            return RegExp(emailRegExp).hasMatch(email ?? '')
                ? null
                : 'Email address is invalid';
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: _controller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              filled: true,
              fillColor: const Color(0xFF9FA4AF).withOpacity(0.5),
              hintText: 'example@gmail.com',
              // errorText: , //formStore.error.email,
              isDense: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)))),
    );
  }
}
