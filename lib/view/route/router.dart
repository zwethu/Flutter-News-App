import 'package:auto_route/annotations.dart';

import 'routes.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen),
    AutoRoute(page: HomeScreen, initial: true),
    AutoRoute(page: ArticleScreen),
    AutoRoute(page: SearchScreen),
  ],
)
class $AppRouter {}
