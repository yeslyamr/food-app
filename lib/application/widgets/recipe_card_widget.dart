import 'package:flutter/material.dart';
import 'package:recipe_app/domain/models/search_response/recipe_info.dart';

class RecipeCardWidget extends StatelessWidget {
  const RecipeCardWidget({super.key, required this.item});

  final RecipeInfo item;

  @override
  Widget build(BuildContext context) {
    final int time = item.readyInMinutes ?? 0;
    final String dishType =
        (item.dishTypes != null && (item.dishTypes?.isNotEmpty ?? false))
            ? item.dishTypes!.first
            : 'main course';

    return Container(
      decoration: BoxDecoration(
        border:
            Border.all(width: 2, color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 321 / 231,
                child: Image.network(
                  item.image ?? '',
                  fit: BoxFit.fill,
                ),
              ),
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
                  child: IconButton(
                    splashRadius: 10,
                    onPressed: () {
                      // TODO: impl add to fav
                    },
                    icon: const Icon(Icons.bookmark_border),
                    color: Colors.white,
                  ),
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
            child: Expanded(
              child: Text(
                item.title.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8.0),
            child: Text(
              '${item.extendedIngredients?.length.toString()} indgredients',
            ),
          )
        ],
      ),
    );
  }
}
