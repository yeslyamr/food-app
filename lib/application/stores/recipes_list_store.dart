// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:recipe_app/core/Utils.dart';
import 'package:recipe_app/data/gateways/api_exceptions.dart';
import 'package:recipe_app/domain/models/search_response/recipe_info.dart';
import 'package:recipe_app/domain/services/recipes_service.dart';

part 'recipes_list_store.g.dart';

class RecipesListStore = _RecipesListStore with _$RecipesListStore;

abstract class _RecipesListStore with Store {
  final _recipesService = RecipesServiceImpl();

  //this Mobx store will be needed for another types of searches, i.e. including ingredients and nutritions

  Future<List<RecipeInfo>> getRecipes(
      {required String query, required int offset, int number = 20}) async {
    try {
      return await _recipesService.getListOfRecipes(
          query: query, offset: offset, number: number);
    } on ApiException catch (e) {
      Utils.showSnackBar(e.message);
      rethrow;
    }
    // return [];
  }
}
