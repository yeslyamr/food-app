// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:recipe_app/domain/models/search_response/recipe_info.dart';
import 'package:recipe_app/domain/services/cloud_firestore_service.dart';

part 'favourite_recipes_store.g.dart';

class FavouriteRecipesStore = _FavouriteRecipesStore
    with _$FavouriteRecipesStore;

abstract class _FavouriteRecipesStore with Store {
  final _cloudFirestoreService = CloudFirestoreServiceImpl();

  _FavouriteRecipesStore() {
    favouriteRecipesStream.listen((querySnapshot) {
      for (var documentChange in querySnapshot.docChanges) {
        switch (documentChange.type) {
          case DocumentChangeType.added:
            final docData = documentChange.doc.data();
            if (docData != null) {
              final recipeInfo = RecipeInfo.fromJson(docData);
              if (!favouriteRecipesMap
                  .containsKey(documentChange.doc.reference)) {
                favouriteRecipesMap[documentChange.doc.reference] = recipeInfo;
              }
            }
            break;
          case DocumentChangeType.modified:
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
    });
  }

  Future<void> addRecipeInfoToFavourite(
      {required RecipeInfo recipeInfo}) async {
    final documentReferenceToAddedRecipe = await _cloudFirestoreService
        .addRecipeInfoToFavourite(recipeInfo: recipeInfo);
    if (documentReferenceToAddedRecipe != null) {
      favouriteRecipesMap[documentReferenceToAddedRecipe] = recipeInfo;
    }
  }

  void removeRecipeInfoFromFavourite(
      {required DocumentReference? docRefToDelete}) {
    if (docRefToDelete != null) {
      favouriteRecipesMap.remove(docRefToDelete);
      _cloudFirestoreService.removeFromFavouriteRecipes(
          docRefToDelete: docRefToDelete);
    }
  }

  @observable
  ObservableMap<DocumentReference, RecipeInfo> favouriteRecipesMap =
      ObservableMap<DocumentReference, RecipeInfo>.of({});

  @observable
  ObservableStream<QuerySnapshot<Map<String, dynamic>>> favouriteRecipesStream =
      ObservableStream(FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('favouriteRecipes')
          .snapshots());
}
