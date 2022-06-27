import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/application/navigation/auto_router.dart';
import 'package:recipe_app/application/stores/recipes_list_store.dart';
import 'package:recipe_app/application/widgets/recipe_in_list_widget.dart';
import 'package:recipe_app/domain/models/search_response/recipe_info.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class RecipesListPage extends StatefulWidget {
  const RecipesListPage({Key? key, required this.query}) : super(key: key);

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
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black26,
                  ),
                  child: const AutoLeadingButton(color: Colors.white),
                ),
                Expanded(
                  child: Container(
                    height: 44,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      readOnly: true,
                      onTap: () => AutoRouter.of(context).pop(),
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        prefixIcon: const Icon(Icons.search),
                        hintText: widget.query,
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PagedGridView<int, RecipeInfo>(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.85,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  mainAxisExtent: null),
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<RecipeInfo>(
                  // newPageProgressIndicatorBuilder: (context) => Container(
                  //   // width: double.infinity,
                  //   alignment: Alignment.center,
                  //   child: const CircularProgressIndicator(),
                  // ),
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
                      splashColor: Colors.red,
                      onTap: () {
                        AutoRouter.of(context)
                            .push(RecipeRoute(recipeInfo: item));
                        print('QEWR');
                      },
                      child: RecipeCard(item: item),
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
