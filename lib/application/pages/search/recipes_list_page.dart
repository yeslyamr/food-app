import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/application/navigation/auto_router.dart';
import 'package:recipe_app/application/stores/recipes_list_store.dart';
import 'package:recipe_app/application/stores/favourite_recipes_store.dart';
import 'package:recipe_app/application/widgets/recipe_card_widget.dart';
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
  static const _pageSize = 20;

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
      final newItems =
          await _store.getRecipes(query: widget.query, offset: pageKey);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildTextField(context),
          Expanded(
            child: PagedGridView<int, RecipeInfo>(
              showNewPageProgressIndicatorAsGridChild: false,
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
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
                  itemBuilder: (context, item, index) {
                    return InkWell(
                      onTap: () {
                        AutoRouter.of(context)
                            .push(RecipeRoute(recipeInfo: item));
                      },
                      child: RecipeCardWidget(
                        recipeInfo: item,
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

  Container _buildTextField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        readOnly: true,
        onTap: () {
          AutoRouter.of(context).pop();
        },
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: const Icon(Icons.search),
          hintText: widget.query,
          isDense: true,
          border: OutlineInputBorder(
            // borderSide: const BorderSide(
            //   color: Color.fromRGBO(255, 156, 0, 1),
            // ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
