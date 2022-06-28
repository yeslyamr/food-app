import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/application/navigation/auto_router.dart';
class MainScreenPage extends StatelessWidget {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AutoTabsScaffold(
        routes: const [
          Search(),
          Saved(),
        ],
        appBarBuilder: (_, tabsRouter) {
          return
              //  tabsRouter.current.name == SearchRouter.name
              //     ? PreferredSize(
              //         preferredSize: Size(0, 0),
              //         child: Container(),
              //       )
              //     :
              AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(tabsRouter.current.name),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: InkWell(
                  onTap: () {
                    AutoRouter.of(context).push(const ProfileRoute());
                  },
                  child: CircleAvatar(
                      foregroundImage: FirebaseAuth
                                  .instance.currentUser?.photoURL !=
                              null
                          ? NetworkImage(
                              FirebaseAuth.instance.currentUser?.photoURL ?? '')
                          : null),
                ),
              )
            ],
            leading: tabsRouter.canPopSelfOrChildren
                ? const AutoLeadingButton()
                : null,
          );
        },
        bottomNavigationBuilder:
            (BuildContext context, TabsRouter tabsRouter) =>
                BottomNavigationBar(
                    currentIndex: tabsRouter.activeIndex,
                    onTap: tabsRouter.setActiveIndex,
                    items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: ('Search'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_sharp),
                label: ('Saved'),
              ),
            ]),
      ),
    );
  }
}
