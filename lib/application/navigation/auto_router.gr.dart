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
    RecipesListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const RecipesListPage());
    },
    MainScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const MainScreenPage());
    },
    SavedRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    SearchRouter.name: (routeData) {
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
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SignInRoute.name, path: '/login'),
        RouteConfig(SignUpRoute.name, path: '/register'),
        RouteConfig(EmailVerificationRoute.name, path: '/emailverification'),
        RouteConfig(PasswordResetRoute.name, path: '/login/passwordreset'),
        RouteConfig(RecipesListRoute.name, path: '/recipes'),
        RouteConfig(MainScreenRoute.name, path: '/', guards: [
          authGuard
        ], children: [
          RouteConfig(SavedRouter.name,
              path: 'savedrecipes',
              parent: MainScreenRoute.name,
              children: [
                RouteConfig(SavedRoute.name, path: '', parent: SavedRouter.name)
              ]),
          RouteConfig(SearchRouter.name,
              path: 'search',
              parent: MainScreenRoute.name,
              children: [
                RouteConfig(SearchRoute.name,
                    path: '', parent: SearchRouter.name)
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
/// [RecipesListPage]
class RecipesListRoute extends PageRouteInfo<void> {
  const RecipesListRoute() : super(RecipesListRoute.name, path: '/recipes');

  static const String name = 'RecipesListRoute';
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
class SavedRouter extends PageRouteInfo<void> {
  const SavedRouter({List<PageRouteInfo>? children})
      : super(SavedRouter.name,
            path: 'savedrecipes', initialChildren: children);

  static const String name = 'SavedRouter';
}

/// generated route for
/// [EmptyRouterPage]
class SearchRouter extends PageRouteInfo<void> {
  const SearchRouter({List<PageRouteInfo>? children})
      : super(SearchRouter.name, path: 'search', initialChildren: children);

  static const String name = 'SearchRouter';
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
