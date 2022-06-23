import 'package:recipe_app/core/Utils.dart';
import 'package:recipe_app/data/gateways/api_exceptions.dart';
import 'package:recipe_app/data/repositories/recipes_repository.dart';
import 'package:recipe_app/domain/models/autocomplete_search.dart';

abstract class RecipesService {}

class RecipesServiceImpl extends RecipesService {
  final RecipesRepository recipesRepo = RecipesRepositoryImpl();

  Future<List<AutocompleteSearch>> getAutocompleteRecipeSearch(
      {required String query, int? number}) {
    try {
      return recipesRepo.autocompleteRecipeSearch(query: query, number: number);
    } on ApiException catch (e) {
      Utils.showSnackBar(e.toString());
      rethrow;
    }
  }
}
