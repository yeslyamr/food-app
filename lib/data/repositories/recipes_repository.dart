import 'package:recipe_app/data/gateways/api_constants.dart';
import 'package:recipe_app/data/gateways/network_client.dart';
import 'package:recipe_app/domain/models/autocomplete_search.dart';
import 'package:recipe_app/domain/models/search_response/recipe_info.dart';
import 'package:recipe_app/domain/models/search_response/search_response.dart';

abstract class RecipesRepository {
  Future<List<AutocompleteSearch>> autocompleteRecipeSearch(
      {required String query, int? number});

  Future<SearchResponse> searchRecipes(
      {required String query, required int offset, int? number});

  Future<RecipeInfo> getRecipeInfo({required int id});
}

class RecipesRepositoryImpl implements RecipesRepository {
  final NetworkClient _client = NetworkClient();

  @override
  Future<List<AutocompleteSearch>> autocompleteRecipeSearch(
      {required String query, int? number}) async {
    try {
      return await _client.get(
          path: ApiConstants.autocompleteSearchEndpoint,
          parameters: {
            'apiKey': ApiConstants.apiKey,
            'query': query,
            'number': number.toString(),
          },
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
  Future<SearchResponse> searchRecipes(
      {required String query, required int offset, int? number}) async {
    try {
      return await _client.get(
          path: ApiConstants.searchEndpoint,
          parameters: {
            'apiKey': ApiConstants.apiKey,
            'query': query,
            'number': number.toString(),
            'offset': (offset).toString(),
            'instructionsRequired': true.toString(),
            'addRecipeInformation': true.toString(),
            'fillIngredients': true.toString(),
          },
          parser: (dynamic json) {
            return SearchResponse.fromJson(json);
          });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RecipeInfo> getRecipeInfo({required int id}) async {
    try {
      return await _client.get(
          path: '/recipes/$id/information',
          parameters: {'apiKey': ApiConstants.apiKey},
          parser: (dynamic json) {
            return RecipeInfo.fromJson(json);
          });
    } catch (e) {
      rethrow;
    }
  }
}
