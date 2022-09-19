import 'package:auto_route/annotations.dart';
import 'routes.dart';



@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: NewsScreen),
    AutoRoute(page: FavouritesScreen),
    AutoRoute(page: ArticleScreen),
    AutoRoute(page: SearchScreen),
  ],
)
class $AppRouter {}
