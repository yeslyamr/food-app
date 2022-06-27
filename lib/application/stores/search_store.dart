// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:recipe_app/core/Utils.dart';
import 'package:recipe_app/domain/models/autocomplete_search.dart';
import 'package:recipe_app/domain/services/recipes_service.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStore with _$SearchStore;

abstract class _SearchStore with Store {
  final _recipesService = RecipesServiceImpl();

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
    try {
      final result = await _recipesService.getAutocompleteRecipeSearch(
          query: query, number: number);
      autocompleteSuggestions.clear();
      for (var element in result) {
        autocompleteSuggestions.add(element);
      }
    } catch (e) {
      Utils.showSnackBar(e.toString(), backgroundColor: Colors.red);
    }
  }

  @action
  void emptyAutocompleteSuggestions() {
    autocompleteSuggestions.clear();
  }
}
