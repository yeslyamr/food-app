import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            const Text('Search'),
            Text(AutoRouter.of(context).isRoot.toString()),
            Text(context.router.stack.toString()),
          ],
        ),
      ),
    );
  }
}
