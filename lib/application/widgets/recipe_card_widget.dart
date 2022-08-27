import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/application/stores/connectivity_store.dart';
import 'package:recipe_app/application/stores/favourite_recipes_store.dart';
import 'package:recipe_app/core/Utils.dart';
import 'package:recipe_app/domain/models/search_response/recipe_info.dart';

class RecipeCardWidget extends StatelessWidget {
  const RecipeCardWidget(
      {super.key, required this.recipeInfo, required this.favouriteStore});

  final RecipeInfo recipeInfo;
  final FavouriteRecipesStore favouriteStore;

  @override
  Widget build(BuildContext context) {
    final int time = recipeInfo.readyInMinutes ?? 0;
    final String dishType = (recipeInfo.dishTypes != null &&
            (recipeInfo.dishTypes?.isNotEmpty ?? false))
        ? recipeInfo.dishTypes!.first
        : 'main course';

    final connectivityStore = Provider.of<ConnectivityStore>(context);

    return Container(
      foregroundDecoration: BoxDecoration(
        border:
            Border.all(width: 2, color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(15),
      ),
      decoration: BoxDecoration(
        border:
            Border.all(width: 2, color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.antiAlias,
            children: [
              AspectRatio(
                  aspectRatio: 321 / 231,
                  child: FadeInImage.assetNetwork(
                    image: recipeInfo.image ?? '',
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Image.asset('assets/img/unnamed.png'),
                    fadeInCurve: Curves.easeIn,
                    fadeInDuration: const Duration(milliseconds: 150),
                    fit: BoxFit.fill,
                    placeholder: 'assets/img/logo_transparent.png',
                    placeholderErrorBuilder: (context, error, stackTrace) =>
                        Image.asset('assets/img/unnamed.png'),
                  )),
              Positioned(
                left: 5,
                top: 5,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    dishType,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black45,
                  ),
                  child: Observer(
                      warnWhenNoObservables: true,
                      builder: (_) {
                        bool isInFav = false;
                        DocumentReference? docRefToRecipeToBeDeleted;
                        for (var key
                            in favouriteStore.favouriteRecipesMap.keys) {
                          if (favouriteStore.favouriteRecipesMap[key]?.id ==
                              recipeInfo.id) {
                            isInFav = true;
                            docRefToRecipeToBeDeleted = key;
                          }
                        }
                        return IconButton(
                            splashRadius: 25,
                            icon: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 450),
                                transitionBuilder: (child, anim) =>
                                    ScaleTransition(
                                      scale: anim,
                                      child: child,
                                    ),
                                child: isInFav
                                    ? const Icon(Icons.bookmark,
                                        color: Colors.white,
                                        key: ValueKey('icon1'))
                                    : const Icon(
                                        Icons.bookmark_outline_rounded,
                                        color: Colors.white,
                                        key: ValueKey('icon2'),
                                      )),
                            onPressed: connectivityStore.connectionStatus ==
                                    ConnectivityResult.none
                                ? () {
                                    Utils.showSnackBar('No connection');
                                  }
                                : () {
                                    if (isInFav) {
                                      favouriteStore
                                          .removeRecipeInfoFromFavourite(
                                              docRefToDelete:
                                                  docRefToRecipeToBeDeleted);
                                    } else {
                                      favouriteStore.addRecipeInfoToFavourite(
                                          recipeInfo: recipeInfo);
                                    }
                                  });
                      }),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 5,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '$time min',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8, bottom: 1),
            child: Text(
              recipeInfo.title.toString(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8.0),
            child: Text(
              '${recipeInfo.extendedIngredients?.length.toString()} indgredients',
            ),
          )
        ],
      ),
    );
  }
}
