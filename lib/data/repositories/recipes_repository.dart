import 'package:recipe_app/data/gateways/api_constants.dart';
import 'package:recipe_app/data/gateways/network_client.dart';
import 'package:recipe_app/domain/models/autocomplete_search.dart';

abstract class RecipesRepository {
  Future<List<AutocompleteSearch>> autocompleteRecipeSearch(
      {required String query, int? number});

  void searchRecipes({required String query}) {}

  // Future<InlineResponse200> searchRecipes({ String query, String cuisine, String excludeCuisine, String diet, String intolerances, String equipment, String includeIngredients, String excludeIngredients, String type, bool instructionsRequired, bool fillIngredients, bool addRecipeInformation, bool addRecipeNutrition, String author, String tags, num recipeBoxId, String titleMatch, num maxReadyTime, bool ignorePantry, String sort, String sortDirection, num minCarbs, num maxCarbs, num minProtein, num maxProtein, num minCalories, num maxCalories, num minFat, num maxFat, num minAlcohol, num maxAlcohol, num minCaffeine, num maxCaffeine, num minCopper, num maxCopper, num minCalcium, num maxCalcium, num minCholine, num maxCholine, num minCholesterol, num maxCholesterol, num minFluoride, num maxFluoride, num minSaturatedFat, num maxSaturatedFat, num minVitaminA, num maxVitaminA, num minVitaminC, num maxVitaminC, num minVitaminD, num maxVitaminD, num minVitaminE, num maxVitaminE, num minVitaminK, num maxVitaminK, num minVitaminB1, num maxVitaminB1, num minVitaminB2, num maxVitaminB2, num minVitaminB5, num maxVitaminB5, num minVitaminB3, num maxVitaminB3, num minVitaminB6, num maxVitaminB6, num minVitaminB12, num maxVitaminB12, num minFiber, num maxFiber, num minFolate, num maxFolate, num minFolicAcid, num maxFolicAcid, num minIodine, num maxIodine, num minIron, num maxIron, num minMagnesium, num maxMagnesium, num minManganese, num maxManganese, num minPhosphorus, num maxPhosphorus, num minPotassium, num maxPotassium, num minSelenium, num maxSelenium, num minSodium, num maxSodium, num minSugar, num maxSugar, num minZinc, num maxZinc, int offset, int number, bool limitLicense }) async {

}

class RecipesRepositoryImpl implements RecipesRepository {
  final NetworkClient _client = NetworkClient();

  @override
  Future<List<AutocompleteSearch>> autocompleteRecipeSearch(
      {required String query, int? number}) async {
    try {
      return await _client.get(
          path: ApiConstants.autocompleteSearchEndpoint,
          parameters: {'query': query, 'number': number.toString()},
          parser: (dynamic jsonArray) {
            List<AutocompleteSearch> result = [];
            for (var element in jsonArray) {
              result.add(AutocompleteSearch.fromMap(element));
            }
            return result;
          });
    } catch (e) {
      rethrow;
    }
  }

  @override
  void searchRecipes({required String query}) {
    // TODO: implement searchRecipes
  }
}
