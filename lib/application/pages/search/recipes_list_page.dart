import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/application/navigation/auto_router.dart';
import 'package:recipe_app/application/stores/recipes_list_store.dart';
import 'package:recipe_app/application/stores/favourite_recipes_store.dart';
import 'package:recipe_app/application/widgets/recipe_card_widget.dart';
import 'package:recipe_app/core/Utils.dart';
import 'package:recipe_app/domain/models/search_response/recipe_info.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class RecipesListPage extends StatefulWidget {
  const RecipesListPage(
      {Key? key, required this.query, required this.favouriteStore})
      : super(key: key);

  final FavouriteRecipesStore favouriteStore;
  final String query;

  @override
  State<RecipesListPage> createState() => _RecipesListPageState();
}

class _RecipesListPageState extends State<RecipesListPage> {
  final _store = RecipesListStore();
  static const _pageSize = 10;

  final PagingController<int, RecipeInfo> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await _store.getRecipes(
          query: widget.query, offset: pageKey, number: _pageSize);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      Utils.showSnackBar(error.toString());
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () {
          _pagingController.refresh();
        },
      ),
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              floating: true,
              delegate:
                  MySilverPersistentHeaderDelegate(hintText: widget.query)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            sliver: PagedSliverGrid<int, RecipeInfo>(
              showNewPageErrorIndicatorAsGridChild: false,
              showNewPageProgressIndicatorAsGridChild: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.85,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  mainAxisExtent: null),
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<RecipeInfo>(
                  noItemsFoundIndicatorBuilder: (context) => Container(
                        padding: const EdgeInsets.only(top: 26.0),
                        width: double.infinity,
                        child: const Text(
                          'No recipes found',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                  itemBuilder: (context, recipeInfo, index) {
                    return InkWell(
                      onTap: () {
                        AutoRouter.of(context)
                            .push(RecipeRoute(recipeInfo: recipeInfo));
                      },
                      borderRadius: BorderRadius.circular(15),
                      child: RecipeCardWidget(
                        recipeInfo: recipeInfo,
                        favouriteStore: widget.favouriteStore,
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

class MySilverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String hintText;

  MySilverPersistentHeaderDelegate({required this.hintText});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          color: Theme.of(context).colorScheme.surface),
      constraints: const BoxConstraints(minHeight: 68),
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: TextField(
        readOnly: true,
        onTap: () {
          AutoRouter.of(context).pop();
        },
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: const Icon(Icons.search),
          hintText: hintText,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 68;

  @override
  double get minExtent => 68;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
