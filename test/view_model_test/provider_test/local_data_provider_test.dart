import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/model/entities/article.dart';
import 'package:news_app/model/hive/article_box.dart';
import 'package:news_app/model/repository/bookmark_article_repo.dart';
import 'package:news_app/view_model/provider/local_data_provider.dart';
import '../../test_sources/file_reader.dart';
import 'local_data_provider_test.mocks.dart';

@GenerateMocks([BookmarkArticleRepoImp])
void main() {
  final MockBookmarkArticleRepo repo = MockBookmarkArticleRepo();
  LocalDataProvider provider;
  ArticleBox data = ArticleBox()
    ..author = "author"
    ..title = "title"
    ..description = "description"
    ..url = "url"
    ..urlToImage = "urlToImage"
    ..publishedAt = "publishedAt"
    ..content = "content";

  group("test getBOOKmarkArticle - ", () {
    test("return [] when there is no data", () {
      when(repo.getArticles(any)).thenAnswer((_) => []);
      provider = LocalDataProvider(repo);
      provider.getBookmarkArticle();
      expect([], provider.list);
      verify(repo.getArticles(any)).called(2);
    });
    test("return list of Article", () {
      when(repo.getArticles(any)).thenAnswer((_) => []);
      provider = LocalDataProvider(repo);
      when(repo.getArticles('bookmark')).thenAnswer((_) => [data]);
      provider.getBookmarkArticle();
      expect([data], provider.list);
      verify(repo.getArticles(any)).called(2);
    });
  });
  group("test constructor - ", () {
    test('return [] when object is created and there is no data', () {
      when(repo.getArticles(any)).thenAnswer((realInvocation) => []);
      provider = LocalDataProvider(repo);
      expect([], provider.list);
      verify(repo.getArticles(any)).called(1);
    });
    test('return [data] when object is created and there is data', () {
      when(repo.getArticles(any)).thenAnswer((realInvocation) => [data]);
      provider = LocalDataProvider(repo);
      expect([data], provider.list);
      verify(repo.getArticles(any)).called(1);
    });
  });

  test("test bookmarkArticle()", () {
    final Map<String, dynamic> jsonData =
        json.decode(readFile('tArticles.json'));
    Article articles = Article.fromJson(jsonData);
    when(repo.getArticles(any)).thenAnswer((realInvocation) => []);
    provider = LocalDataProvider(repo);
    provider.bookmarkArticle(articles);
    expect(provider.list, [isA<ArticleBox>()]);
    verify(repo.saveInHive(any)).called(1);
  });

  test("test removeBookmark()", () {
    final Map<String, dynamic> jsonData =
        json.decode(readFile('tArticles.json'));
    Article articles = Article.fromJson(jsonData);
      ArticleBox data = ArticleBox()
      ..author = articles.author ?? ''
      ..title = articles.title ?? ''
      ..description = articles.description ?? ''
      ..url = articles.url ?? ''
      ..urlToImage = articles.urlToImage ?? ''
      ..publishedAt = articles.publishedAt ?? ''
      ..content = articles.content ?? '';
      
    when(repo.getArticles(any)).thenAnswer((realInvocation) => [data]);
    provider = LocalDataProvider(repo);
    when(repo.removeFromHive(any)).thenAnswer((realInvocation) => []);
    provider.removeBookmark(articles);
    verify(repo.removeFromHive(any));
  });
}
