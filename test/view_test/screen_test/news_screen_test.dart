import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/model/repository/online_article_repo_imp.dart';
import 'package:news_app/model/service/news_api_service.dart';
import 'package:news_app/view/screen/news_screen.dart';
import 'package:news_app/view_model/bloc/online_article_bloc/online_article_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  testWidgets('test NewsScreen', (widgetTester) async {
    http.Client client = http.Client();
    NewsApiService service = NewsApiService(client);
    OnlineArticleRepoImp repo = OnlineArticleRepoImp(service);
    await widgetTester.pumpWidget(
      BlocProvider(
        create: (context) => OnlineArticleBloc(repo),
        child: const MaterialApp(
        home: Scaffold(
          body: NewsScreen(),
        ),
      ),
      ),
    );
    final searchLogo = find.text('News');
    final searchTabBar = find.byType(TabBar);
    final findSearchIcon = find.byIcon(Icons.search_outlined);
    final findTabs = find.byType(Tab);
    expect(searchLogo, findsOneWidget);
    expect(searchTabBar, findsOneWidget);
    expect(findTabs, findsNWidgets(5));
    expect(findSearchIcon, findsOneWidget);
  });
}
