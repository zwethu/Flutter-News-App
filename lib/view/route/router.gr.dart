// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import 'routes.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    NewsScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NewsScreen());
    },
    FavouritesScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.FavouritesScreen());
    },
    ArticleScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ArticleScreen());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(SplashScreen.name, path: '/'),
        _i2.RouteConfig(NewsScreen.name, path: '/news-screen'),
        _i2.RouteConfig(FavouritesScreen.name, path: '/favourites-screen'),
        _i2.RouteConfig(ArticleScreen.name, path: '/article-screen')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i2.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i1.NewsScreen]
class NewsScreen extends _i2.PageRouteInfo<void> {
  const NewsScreen() : super(NewsScreen.name, path: '/news-screen');

  static const String name = 'NewsScreen';
}

/// generated route for
/// [_i1.FavouritesScreen]
class FavouritesScreen extends _i2.PageRouteInfo<void> {
  const FavouritesScreen()
      : super(FavouritesScreen.name, path: '/favourites-screen');

  static const String name = 'FavouritesScreen';
}

/// generated route for
/// [_i1.ArticleScreen]
class ArticleScreen extends _i2.PageRouteInfo<void> {
  const ArticleScreen() : super(ArticleScreen.name, path: '/article-screen');

  static const String name = 'ArticleScreen';
}
