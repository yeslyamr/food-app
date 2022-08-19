// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_recipes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavouriteRecipesStore on _FavouriteRecipesStore, Store {
  late final _$favouriteRecipesMapAtom = Atom(
      name: '_FavouriteRecipesStore.favouriteRecipesMap', context: context);

  @override
  ObservableMap<DocumentReference<Object?>, RecipeInfo>
      get favouriteRecipesMap {
    _$favouriteRecipesMapAtom.reportRead();
    return super.favouriteRecipesMap;
  }

  @override
  set favouriteRecipesMap(
      ObservableMap<DocumentReference<Object?>, RecipeInfo> value) {
    _$favouriteRecipesMapAtom.reportWrite(value, super.favouriteRecipesMap, () {
      super.favouriteRecipesMap = value;
    });
  }

  late final _$favouriteRecipesStreamAtom = Atom(
      name: '_FavouriteRecipesStore.favouriteRecipesStream', context: context);

  @override
  ObservableStream<QuerySnapshot<Map<String, dynamic>>>
      get favouriteRecipesStream {
    _$favouriteRecipesStreamAtom.reportRead();
    return super.favouriteRecipesStream;
  }

  @override
  set favouriteRecipesStream(
      ObservableStream<QuerySnapshot<Map<String, dynamic>>> value) {
    _$favouriteRecipesStreamAtom
        .reportWrite(value, super.favouriteRecipesStream, () {
      super.favouriteRecipesStream = value;
    });
  }

  @override
  String toString() {
    return '''
favouriteRecipesMap: ${favouriteRecipesMap},
favouriteRecipesStream: ${favouriteRecipesStream}
    ''';
  }
}
