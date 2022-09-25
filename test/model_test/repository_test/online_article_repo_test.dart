import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/model/entities/article.dart';
import 'package:news_app/model/repository/online_article_repo.dart';
import '../../test_sources/file_reader.dart';
import 'online_article_repo_test.mocks.dart';

@GenerateMocks([OnlineArticleRepo])
void main() {
  MockOnlineArticleRepo repo = MockOnlineArticleRepo();
  group('get Article from news api service - ', () {
    test('', () async {
      when(repo.getArticles(any)).thenAnswer(
        (_) async => Article.fromJson(
          json.decode(
            readFile('tArticle.json'),
          ),
        ).articles,
      );
      final result = await repo.getArticles('topic');
      expect(
        result,
        equals(
          [
            Articles.fromJson(
              json.decode(
                readFile('tArticles.json'),
              ),
            ),
          ],
        ),
      );
      verify(repo.getArticles('topic')).called(1);
    });
  });
}
