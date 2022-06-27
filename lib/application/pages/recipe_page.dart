import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:recipe_app/domain/models/search_response/recipe_info.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key, required this.recipeInfo});

  final RecipeInfo recipeInfo;

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(widget.recipeInfo.title ?? ''),
      ),
    );
  }
}
