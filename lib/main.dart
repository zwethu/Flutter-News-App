import 'package:flutter/material.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/model/hive/article_box.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/view/route/router.gr.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ArticleBoxAdapter());
  await Hive.openBox<ArticleBox>(articleBox);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
