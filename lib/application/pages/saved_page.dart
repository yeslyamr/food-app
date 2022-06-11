import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/application/navigation/auto_router.dart';
import 'package:recipe_app/application/stores/auth/auth_store.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Saved Page'),
          Text(AutoRouter.of(context).isRoot.toString()),
          Text(context.router.stack.toString()),
          ElevatedButton(
              onPressed: () {
                authStore.signOut();
                AutoRouter.of(context).replace(const SignInRoute());
              },
              child: const Text('sign out')),
          // Text(AutoRouter.of(context).currentPath),
        ],
      )),
    );
  }
}
