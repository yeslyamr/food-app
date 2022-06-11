import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/application/navigation/auto_router.dart';
import 'package:recipe_app/application/pages/recipes_list_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
    'a',
    'ab',
    'ac',
    'ad',
    'ae',
    'af',
    'ag',
    'ah',
  ];

  static const isThereOptions = false;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // _controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.red.shade300,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Autocomplete(
              fieldViewBuilder: (context, textEditingController, focusNode,
                      onFieldSubmitted) =>
                  SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    textInputAction: TextInputAction.search,
                    onEditingComplete: () {},// onFieldSubmitted,
                    onFieldSubmitted: (value) {
                      debugPrint('ASDF');
                      AutoRouter.of(context)
                          .root
                          .push(const RecipesListRoute());
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search Recipess',
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              optionsViewBuilder: (context, onSelected, options) => Align(
                alignment: Alignment.topLeft,
                child: Material(
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(4.0)),
                  ),
                  child: Container(
                      color: Colors.amber,
                      height: MediaQuery.of(context).size.height -
                          kBottomNavigationBarHeight -
                          kToolbarHeight -
                          MediaQuery.of(context).padding.bottom -
                          MediaQuery.of(context).padding.top -
                          58,
                      child: Column(
                        children: [
                          for (String op in SearchPage._kOptions)
                            InkWell(
                              onTap: () {
                                debugPrint('ASDF');
                                AutoRouter.of(context)
                                    .root
                                    .push(const RecipesListRoute());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.search),
                                    Text(op),
                                  ],
                                ),
                              ),
                            )
                        ],
                      )),
                ),
              ),
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return SearchPage._kOptions.where(
                  (String option) {
                    return option.contains(textEditingValue.text.toLowerCase());
                  },
                );
              },
              onSelected: (String selection) {
                debugPrint('You just selected $selection');
              },
            ),
          ),
          // Container(
          //   height: 100,
          //   width: 100,
          //   child: Text(_controller.text),
          // ),
        ],
      ),
    );
  }
}
