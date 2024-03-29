import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/model/repository/online_article_repo_imp.dart';
import 'package:news_app/model/service/news_api_service.dart';
import 'package:news_app/view/screen/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/view_model/bloc/online_article_bloc/online_article_bloc.dart';

void main() {
  testWidgets('test home screen', (tester) async {
    http.Client client = http.Client();
    NewsApiService service = NewsApiService(client);
    OnlineArticleRepoImp repo = OnlineArticleRepoImp(service);
    await tester.pumpWidget(
      BlocProvider(
        create: (context) => OnlineArticleBloc(repo),
        child: const MaterialApp(
          home: Scaffold(
            body: HomeScreen(),
          ),
        ),
      ),
    );
    final searchNavigationBar = find.byType(BottomNavigationBar);
    expect(searchNavigationBar, findsOneWidget);
  });
}
