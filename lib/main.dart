import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/model/hive/article_box.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/model/repository/online_article_repo.dart';
import 'package:news_app/view/route/router.gr.dart';
import 'package:news_app/view_model/bloc/online_article_bloc/online_article_bloc.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize hive
  await Hive.initFlutter();
  // register hive adapter
  Hive.registerAdapter(ArticleBoxAdapter());
  // open hive
  await Hive.openBox<ArticleBox>(articleBox);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    OnlineArticleRepo repo = OnlineArticleRepo(http.Client());
    return BlocProvider(
      create: (context) => OnlineArticleBloc(repo),
      child: MaterialApp.router(
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
