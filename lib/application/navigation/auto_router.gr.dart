// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'auto_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter(
      {GlobalKey<NavigatorState>? navigatorKey, required this.authGuard})
      : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    SignInRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SignInPage());
    },
    SignUpRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SignUpPage());
    },
    EmailVerificationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmailVerificationPage());
    },
    PasswordResetRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PasswordResetPage());
    },
    RecipeRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: RecipePage(key: args.key, recipeInfo: args.recipeInfo));
    },
    ProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfilePage());
    },
    MainScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const MainScreenPage());
    },
    Saved.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    Search.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    SavedRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SavedPage());
    },
    SearchRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SearchPage());
    },
    RecipesListRoute.name: (routeData) {
      final args = routeData.argsAs<RecipesListRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: RecipesListPage(key: args.key, query: args.query));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SignInRoute.name, path: '/login'),
        RouteConfig(SignUpRoute.name, path: '/register'),
        RouteConfig(EmailVerificationRoute.name, path: '/emailverification'),
        RouteConfig(PasswordResetRoute.name, path: '/login/passwordreset'),
        RouteConfig(RecipeRoute.name, path: '/recipe/:recipeInfo'),
        RouteConfig(ProfileRoute.name, path: '/profile'),
        RouteConfig(MainScreenRoute.name, path: '/', guards: [
          authGuard
        ], children: [
          RouteConfig(Saved.name,
              path: 'saved',
              parent: MainScreenRoute.name,
              children: [
                RouteConfig(SavedRoute.name, path: '', parent: Saved.name)
              ]),
          RouteConfig(Search.name,
              path: 'search',
              parent: MainScreenRoute.name,
              children: [
                RouteConfig(SearchRoute.name, path: '', parent: Search.name),
                RouteConfig(RecipesListRoute.name,
                    path: ':query', parent: Search.name)
              ])
        ])
      ];
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/login');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/register');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [EmailVerificationPage]
class EmailVerificationRoute extends PageRouteInfo<void> {
  const EmailVerificationRoute()
      : super(EmailVerificationRoute.name, path: '/emailverification');

  static const String name = 'EmailVerificationRoute';
}

/// generated route for
/// [PasswordResetPage]
class PasswordResetRoute extends PageRouteInfo<void> {
  const PasswordResetRoute()
      : super(PasswordResetRoute.name, path: '/login/passwordreset');

  static const String name = 'PasswordResetRoute';
}

/// generated route for
/// [RecipePage]
class RecipeRoute extends PageRouteInfo<RecipeRouteArgs> {
  RecipeRoute({Key? key, required RecipeInfo recipeInfo})
      : super(RecipeRoute.name,
            path: '/recipe/:recipeInfo',
            args: RecipeRouteArgs(key: key, recipeInfo: recipeInfo));

  static const String name = 'RecipeRoute';
}

class RecipeRouteArgs {
  const RecipeRouteArgs({this.key, required this.recipeInfo});

  final Key? key;

  final RecipeInfo recipeInfo;

  @override
  String toString() {
    return 'RecipeRouteArgs{key: $key, recipeInfo: $recipeInfo}';
  }
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '/profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [MainScreenPage]
class MainScreenRoute extends PageRouteInfo<void> {
  const MainScreenRoute({List<PageRouteInfo>? children})
      : super(MainScreenRoute.name, path: '/', initialChildren: children);

  static const String name = 'MainScreenRoute';
}

/// generated route for
/// [EmptyRouterPage]
class Saved extends PageRouteInfo<void> {
  const Saved({List<PageRouteInfo>? children})
      : super(Saved.name, path: 'saved', initialChildren: children);

  static const String name = 'Saved';
}

/// generated route for
/// [EmptyRouterPage]
class Search extends PageRouteInfo<void> {
  const Search({List<PageRouteInfo>? children})
      : super(Search.name, path: 'search', initialChildren: children);

  static const String name = 'Search';
}

/// generated route for
/// [SavedPage]
class SavedRoute extends PageRouteInfo<void> {
  const SavedRoute() : super(SavedRoute.name, path: '');

  static const String name = 'SavedRoute';
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute() : super(SearchRoute.name, path: '');

  static const String name = 'SearchRoute';
}

/// generated route for
/// [RecipesListPage]
class RecipesListRoute extends PageRouteInfo<RecipesListRouteArgs> {
  RecipesListRoute({Key? key, required String query})
      : super(RecipesListRoute.name,
            path: ':query', args: RecipesListRouteArgs(key: key, query: query));

  static const String name = 'RecipesListRoute';
}

class RecipesListRouteArgs {
  const RecipesListRouteArgs({this.key, required this.query});

  final Key? key;

  final String query;

  @override
  String toString() {
    return 'RecipesListRouteArgs{key: $key, query: $query}';
  }
}
