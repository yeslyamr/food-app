import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:recipe_app/application/navigation/auto_router.dart';
import 'package:recipe_app/application/stores/search_store.dart';
import 'package:recipe_app/domain/models/autocomplete_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _store = SearchStore();
  Timer? _debounce;
  // final _controller = TextEditingController();
  // late final FocusNode _focusNode;

  // @override
  // void initState() {
  //   _focusNode = FocusNode();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _focusNode.dispose();
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Observer(builder: (_) {
              _store.autocompleteSuggestions;
              return RawAutocomplete(
                // key: GlobalKey(debugLabel: 'as'),
                // textEditingController: _controller,
                // focusNode: _focusNode,
                fieldViewBuilder: _fieldViewBuilder,
                optionsViewBuilder: _optionsViewBuilder,
                optionsBuilder: _optionsBuilder,
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.green,
              height: 100,
              width: 100,
            ),
          )
        ],
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
      _debounce = Timer(const Duration(milliseconds: 500), () async {
        await _store.updateAutocompleteSuggestions(
            query: textEditingValue.text.trim());
        setState(() {});
      });
    }
    return [AutocompleteSearch(title: '')];
  }

  Widget _fieldViewBuilder(context, TextEditingController textEditingController,
      focusNode, onFieldSubmitted) {
    return SizedBox(
      height: 53,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextFormField(
          controller: textEditingController,
          onChanged: (value) async => setState(() {}),
          focusNode: focusNode,
          textInputAction: TextInputAction.search,
          onFieldSubmitted: (value) =>
              AutoRouter.of(context).push(RecipesListRoute(query: value)),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: textEditingController.text == '' ||
                    textEditingController.text.isEmpty
                ? null
                : IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () => textEditingController.text = '',
                  ),
            hintText: 'Search Recipes',
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }

  Widget _optionsViewBuilder(context, onSelected, options) => Align(
        alignment: Alignment.topLeft,
        child: Material(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(4.0)),
          ),
          child: _store.isAutocompleteSuggestionsListEmpty
              ? null
              : Container(
                  color: Colors.amber,
                  height: MediaQuery.of(context).size.height -
                      kBottomNavigationBarHeight -
                      kToolbarHeight -
                      MediaQuery.of(context).padding.bottom -
                      MediaQuery.of(context).padding.top -
                      61,
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                        itemCount: _store.autocompleteSuggestions.length,
                        itemBuilder: (context, index) => ListTile(
                              leading: const Icon(Icons.search),
                              // trailing: IconButton(
                              //   icon: const Icon(Icons.arrow_upward),
                              //   onPressed: () => _controller.text = _store
                              //           .autocompleteSuggestions[index].title ??
                              //       '',
                              // ),
                              onTap: () => AutoRouter.of(context).push(
                                  RecipesListRoute(
                                      query: _store
                                              .autocompleteSuggestions[index]
                                              .title ??
                                          '')),
                              title: Text(
                                  _store.autocompleteSuggestions[index].title ??
                                      '',
                                  overflow: TextOverflow.ellipsis),
                            )

                        // InkWell(
                        //   onTap: () => AutoRouter.of(context).push(
                        //       RecipesListRoute(
                        //           query: _store
                        //                   .autocompleteSuggestions[index].title ??
                        //               'no res')),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(16.0),
                        //     child: Row(
                        //       children: [
                        //         const Icon(Icons.search),
                        //         Expanded(
                        //           child: Text(
                        //               _store.autocompleteSuggestions[index]
                        //                       .title ??
                        //                   'asdf',
                        //               overflow: TextOverflow.ellipsis),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        ),
                  ),
                ),
        ),
      );
}
