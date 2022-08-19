import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/core/Utils.dart';
import 'package:recipe_app/domain/models/search_response/recipe_info.dart';

abstract class CloudFirestoreService {
  void removeFromFavouriteRecipes({required DocumentReference docRefToDelete});

  void addRecipeInfoToFavourite({required RecipeInfo recipeInfo});
}

class CloudFirestoreServiceImpl implements CloudFirestoreService {
  @override
  void removeFromFavouriteRecipes({required DocumentReference docRefToDelete}) {
    docRefToDelete.delete();
    Utils.showSnackBar('Recipe has been deleted from favourite',
        backgroundColor: Colors.red);
  }

  @override
  Future<DocumentReference?> addRecipeInfoToFavourite(
      {required RecipeInfo recipeInfo}) async {
    final favouriteRecipesCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('favouriteRecipes');
    final querySnapshot = await favouriteRecipesCollection.get();
    for (var queryDocSnapshot in querySnapshot.docs) {
      if (queryDocSnapshot.data()['id'] == recipeInfo.id) {
        Utils.showSnackBar('This recipe is already in your favourite');
        return null;
      }
    }
    // add to fav
    Utils.showSnackBar('Added to favourite', backgroundColor: Colors.green);

    final docRef = favouriteRecipesCollection.doc();
    docRef.set(recipeInfo.toJson());
    return docRef;
    // return favouriteRecipesCollection.add(recipeInfo.toJson());
  }
}
