import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/application/navigation/auto_router.dart';
import 'package:recipe_app/application/stores/connectivity_store.dart';
import 'package:recipe_app/application/stores/favourite_recipes_store.dart';
import 'package:recipe_app/application/stores/search_store.dart';
import 'package:recipe_app/core/Utils.dart';
import 'package:recipe_app/domain/models/autocomplete_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _store = SearchStore();
  Timer? _debounce;
  final _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey _autocompleteKey = GlobalKey();

  @override
  void initState() {
    // to move cursor to the end of the textfield
    _controller.addListener(() {
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final connectivityStore = Provider.of<ConnectivityStore>(context);

    return ReactionBuilder(
      builder: (BuildContext context) {
        return reaction((_) => connectivityStore.connectivityStream.value,
            (result) {
          if (result == ConnectivityResult.none) {
            Utils.showSnackBar('No internet connection',
                backgroundColor: Colors.red);
          } else {
            Utils.showSnackBar('Connection is restored',
                backgroundColor: Colors.green);
          }
        });
      },
      child: Scaffold(
        body: Observer(
          builder: (context) {
            _store.autocompleteSuggestions;
            return Column(
              children: [
                _buildTextField(context),
                Observer(
                  builder: (_) {
                    connectivityStore.connectionStatus;
                    if (connectivityStore.connectionStatus ==
                        ConnectivityResult.none) {
                      return MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? Image.asset(
                              'assets/img/no_internet.gif',
                            )
                          : const Text('No connection');
                    } else {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: RawAutocomplete(
                          key: _autocompleteKey,
                          textEditingController: _controller,
                          focusNode: _focusNode,
                          optionsViewBuilder: _optionsViewBuilder,
                          optionsBuilder: _optionsBuilder,
                        ),
                      );
                    }
                  },
                ),
                // TODO: something can be added underneath the autocomplete dropdown
              ],
            );
          },
        ),
      ),
    );
  }

  Container _buildTextField(BuildContext context) {
    final favouriteStore = Provider.of<FavouriteRecipesStore>(context);

    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 12),
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        controller: _controller,
        onChanged: (value) {
          setState(() {});
        },
        focusNode: _focusNode,
        textInputAction: TextInputAction.search,
        onEditingComplete: () => AutoRouter.of(context).push(RecipesListRoute(
            query: _controller.text.trim(), favouriteStore: favouriteStore)),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _controller.text == '' || _controller.text.isEmpty
              ? null
              : IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () => _controller.text = '',
                ),
          hintText: 'Search Recipes',
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  FutureOr<Iterable<Object>> _optionsBuilder(
      TextEditingValue textEditingValue) {
    _debounce?.cancel();
    if (textEditingValue.text.trim() == '' || textEditingValue.text.isEmpty) {
      _store.emptyAutocompleteSuggestions();
      setState(() {});
    } else {
      _debounce = Timer(const Duration(milliseconds: 250), () async {
        await _store.updateAutocompleteSuggestions(
            query: textEditingValue.text.trim(), number: 11);
        setState(() {});
      });
    }
    return [AutocompleteSearch(title: '')];
  }

  Widget _optionsViewBuilder(context, onSelected, options) {
    final favouriteStore = Provider.of<FavouriteRecipesStore>(context);

    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(4.0)),
        ),
        child: (_store.isAutocompleteSuggestionsListEmpty &&
                _controller.text == '')
            ? null
            : Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).colorScheme.surface),
                height: MediaQuery.of(context).size.height -
                    kBottomNavigationBarHeight -
                    kToolbarHeight -
                    MediaQuery.of(context).padding.bottom -
                    MediaQuery.of(context).padding.top -
                    68,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll) {
                      overscroll.disallowIndicator();
                      return true;
                    },
                    child: _store.isAutocompleteSuggestionsListEmpty
                        ? Container(
                            alignment: Alignment.topCenter,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ))
                        : ListView.builder(
                            itemCount: _store.autocompleteSuggestions.length,
                            itemBuilder: (context, index) => ListTile(
                              textColor:
                                  Theme.of(context).colorScheme.onSurface,
                              iconColor:
                                  Theme.of(context).colorScheme.onSurface,
                              leading: const Icon(Icons.search),
                              trailing: IconButton(
                                  icon: const Icon(Icons.north_west),
                                  onPressed: () {
                                    final text = _store
                                            .autocompleteSuggestions[index]
                                            .title ??
                                        '';
                                    _controller.text = '$text ';
                                  }),
                              onTap: () {
                                AutoRouter.of(context).push<VoidCallback>(
                                    RecipesListRoute(
                                        query: _store
                                                .autocompleteSuggestions[index]
                                                .title ??
                                            '',
                                        favouriteStore: favouriteStore));
                              },
                              title: Text(
                                  _store.autocompleteSuggestions[index].title ??
                                      '',
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                  ),
                ),
              ),
      ),
    );
  }
}
