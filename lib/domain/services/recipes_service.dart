import 'package:recipe_app/data/gateways/api_exceptions.dart';
import 'package:recipe_app/data/repositories/recipes_repository.dart';
import 'package:recipe_app/domain/models/autocomplete_search.dart';
import 'package:recipe_app/domain/models/search_response/recipe_info.dart';

abstract class RecipesService {
  Future<List<AutocompleteSearch>> getAutocompleteRecipeSearch(
      {required String query, int? number});

  Future<List<RecipeInfo>> getListOfRecipes(
      {required String query, required int offset, int? number});
}

class RecipesServiceImpl implements RecipesService {
  final RecipesRepository recipesRepo = RecipesRepositoryImpl();

  @override
  Future<List<AutocompleteSearch>> getAutocompleteRecipeSearch(
      {required String query, int? number}) {
    try {
      return recipesRepo.autocompleteRecipeSearch(query: query, number: number);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<RecipeInfo>> getListOfRecipes(
      {required String query, required int offset, int? number}) async {
    try {
      final response = await recipesRepo.searchRecipes(
          query: query, offset: offset, number: number);
      return response.results ?? (throw ApiException(2, 'message'));
    } catch (e) {
      rethrow;
    }
  }
}
