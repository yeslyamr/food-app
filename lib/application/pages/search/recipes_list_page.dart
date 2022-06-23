import 'package:flutter/material.dart';

class RecipesListPage extends StatelessWidget {
  const RecipesListPage({Key? key, required this.query}) : super(key: key);

  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('List'),
      // ),
      backgroundColor: Colors.amber,
      body: Center(
        child: Text(query),
      ),
    );
  }
}
