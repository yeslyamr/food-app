// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:recipe_app/domain/models/autocomplete_search.dart';
import 'package:recipe_app/domain/services/recipes_service.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStore with _$SearchStore;

abstract class _SearchStore with Store {
  final recipesService = RecipesServiceImpl();

  @observable
  ObservableList<AutocompleteSearch> autocompleteSuggestions =
      ObservableList<AutocompleteSearch>.of([]);

  @computed
  bool get isAutocompleteSuggestionsListEmpty =>
      autocompleteSuggestions.isEmpty;

  @action
  Future<void> updateAutocompleteSuggestions(
      {required String query, int number = 20}) async {
    // print('UPDATE: ${DateTime.now()}');
    final result = await recipesService.getAutocompleteRecipeSearch(
        query: query, number: number);
    autocompleteSuggestions.clear();
    for (var element in result) {
      autocompleteSuggestions.add(element);
    }
  }

  @action
  void emptyAutocompleteSuggestions() {
    autocompleteSuggestions.clear();
  }
}
