// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchStore on _SearchStore, Store {
  Computed<bool>? _$isAutocompleteSuggestionsListEmptyComputed;

  @override
  bool get isAutocompleteSuggestionsListEmpty =>
      (_$isAutocompleteSuggestionsListEmptyComputed ??= Computed<bool>(
              () => super.isAutocompleteSuggestionsListEmpty,
              name: '_SearchStore.isAutocompleteSuggestionsListEmpty'))
          .value;

  late final _$autocompleteSuggestionsAtom =
      Atom(name: '_SearchStore.autocompleteSuggestions', context: context);

  @override
  ObservableList<AutocompleteSearch> get autocompleteSuggestions {
    _$autocompleteSuggestionsAtom.reportRead();
    return super.autocompleteSuggestions;
  }

  @override
  set autocompleteSuggestions(ObservableList<AutocompleteSearch> value) {
    _$autocompleteSuggestionsAtom
        .reportWrite(value, super.autocompleteSuggestions, () {
      super.autocompleteSuggestions = value;
    });
  }

  late final _$updateAutocompleteSuggestionsAsyncAction = AsyncAction(
      '_SearchStore.updateAutocompleteSuggestions',
      context: context);

  @override
  Future<void> updateAutocompleteSuggestions(
      {required String query, int number = 20}) {
    return _$updateAutocompleteSuggestionsAsyncAction.run(() =>
        super.updateAutocompleteSuggestions(query: query, number: number));
  }

  late final _$_SearchStoreActionController =
      ActionController(name: '_SearchStore', context: context);

  @override
  void emptyAutocompleteSuggestions() {
    final _$actionInfo = _$_SearchStoreActionController.startAction(
        name: '_SearchStore.emptyAutocompleteSuggestions');
    try {
      return super.emptyAutocompleteSuggestions();
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
autocompleteSuggestions: ${autocompleteSuggestions},
isAutocompleteSuggestionsListEmpty: ${isAutocompleteSuggestionsListEmpty}
    ''';
  }
}
