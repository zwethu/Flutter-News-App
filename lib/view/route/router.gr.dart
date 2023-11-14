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

import '../../model/entities/article_response.dart' as _i4;
import 'routes.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    ArticleScreen.name: (routeData) {
      final args = routeData.argsAs<ArticleScreenArgs>();
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.ArticleScreen(
          key: args.key,
          article: args.article,
        ),
      );
    },
    SearchScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SearchScreen(),
      );
    },
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(
          SplashScreen.name,
          path: '/splash-screen',
        ),
        _i2.RouteConfig(
          HomeScreen.name,
          path: '/',
        ),
        _i2.RouteConfig(
          ArticleScreen.name,
          path: '/article-screen',
        ),
        _i2.RouteConfig(
          SearchScreen.name,
          path: '/search-screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i2.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/splash-screen',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreen extends _i2.PageRouteInfo<void> {
  const HomeScreen()
      : super(
          HomeScreen.name,
          path: '/',
        );

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i1.ArticleScreen]
class ArticleScreen extends _i2.PageRouteInfo<ArticleScreenArgs> {
  ArticleScreen({
    _i3.Key? key,
    required _i4.Article article,
  }) : super(
          ArticleScreen.name,
          path: '/article-screen',
          args: ArticleScreenArgs(
            key: key,
            article: article,
          ),
        );

  static const String name = 'ArticleScreen';
}

class ArticleScreenArgs {
  const ArticleScreenArgs({
    this.key,
    required this.article,
  });

  final _i3.Key? key;

  final _i4.Article article;

  @override
  String toString() {
    return 'ArticleScreenArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [_i1.SearchScreen]
class SearchScreen extends _i2.PageRouteInfo<void> {
  const SearchScreen()
      : super(
          SearchScreen.name,
          path: '/search-screen',
        );

  static const String name = 'SearchScreen';
}
