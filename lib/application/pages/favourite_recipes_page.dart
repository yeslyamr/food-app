import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/application/stores/favourite_recipes_store.dart';
import 'package:recipe_app/application/widgets/recipe_card_widget.dart';

class FavouriteRecipesPage extends StatefulWidget {
  const FavouriteRecipesPage({Key? key}) : super(key: key);

  @override
  State<FavouriteRecipesPage> createState() => _FavouriteRecipesPageState();
}

class _FavouriteRecipesPageState extends State<FavouriteRecipesPage> {
  @override
  Widget build(BuildContext context) {
    final favouriteStore = Provider.of<FavouriteRecipesStore>(context);

    return Observer(builder: (_) {
      return Scaffold(
        body: GridView.builder(
          // padding: const EdgeConset,
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),

          itemCount: favouriteStore.favouriteRecipesMap.length,
          itemBuilder: (context, index) {
            return RecipeCardWidget(
              recipeInfo: favouriteStore.favouriteRecipesMap.entries
                  .elementAt(index)
                  .value,
              favouriteStore: favouriteStore,
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.85,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              mainAxisExtent: null),
        ),
      );
    });
  }
}
