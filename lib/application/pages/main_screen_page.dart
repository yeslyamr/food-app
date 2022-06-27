import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/application/navigation/auto_router.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreenPage extends StatelessWidget {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AutoTabsScaffold(
          routes: const [
            SearchRouter(),
            SavedRouter(),
          ],
          // appBarBuilder: (_, tabsRouter) => AppBar(
          //       // title: _buildTextField(context  ),// Text('${tabsRouter.current.name}'),
          //       leading: const AutoLeadingButton(),
          //       centerTitle: true,
          //     ),
          bottomNavigationBuilder:
              (BuildContext context, TabsRouter tabsRouter) => SizedBox(
                    height: kBottomNavigationBarHeight,
                    child: SalomonBottomBar(
                      selectedItemColor: Colors.red,
                      unselectedItemColor: Colors.blue,
                      currentIndex: tabsRouter.activeIndex,
                      onTap: tabsRouter.setActiveIndex,
                      items: [
                        SalomonBottomBarItem(
                            icon: const Icon(Icons.search),
                            title: const Text('Search')),
                        SalomonBottomBarItem(
                            icon: const Icon(Icons.favorite_sharp),
                            title: const Text('Saved'))
                      ],
                    ),
                  )),
    );
  }
}
