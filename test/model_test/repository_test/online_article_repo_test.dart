import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/model/entities/article_response.dart';
import 'package:news_app/model/repository/online_article_repo_imp.dart';
import 'package:news_app/model/service/news_api_service.dart';
import '../../test_sources/file_reader.dart';
import 'online_article_repo_test.mocks.dart';

@GenerateMocks([NewsApiService])
void main() {
  MockNewsApiService service = MockNewsApiService();
  OnlineArticleRepoImp repo = OnlineArticleRepoImp(service);
  ArticleResponse article = ArticleResponse.fromJson(
    json.decode(
      readFile('tArticle.json'),
    ),
  );
  group("test getArticles Method", () {
    test("return list of articles", () async {
      when(service.fetchArticle(any)).thenAnswer((_) async => article);
      final result = await repo.getArticles('');
      expect(result, article.articles);
      verify(service.fetchArticle(''));
    });
  });
}
