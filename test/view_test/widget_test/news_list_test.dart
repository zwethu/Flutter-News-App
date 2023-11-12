import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/model/entities/article.dart';
import 'package:news_app/view/widget/news_list.dart';
import 'package:news_app/view_model/bloc/online_article_bloc/online_article_bloc.dart';

import '../../test_sources/file_reader.dart';

void main() {
  testWidgets('test news list widget', (tester) async {
    Article articles =
        Article.fromJson(jsonDecode(readFile('tArticles.json')));
    List<Article?> articleList = [articles, articles, articles];
    OnlineArticleBlocLoadedState state =
        OnlineArticleBlocLoadedState(articleList);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NewsList(state: state),
        ),
      ),
    );
    final searchImage = find.byType(Image);
    final searchAuthor = find.text('author');
    final searchTitle = find.text('title');
    expect(searchImage, findsNWidgets(state.articleList.length));
    expect(searchAuthor, findsNWidgets(state.articleList.length));
    expect(searchTitle, findsNWidgets(state.articleList.length));
  });
}
