import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/model/entities/article.dart';

import '../../test_sources/file_reader.dart';

void main() {
  group('testing for source object', () {
    Source tSource = Source('CNN', 'CNN');

    test('change data from json to Source type', () {
      final Map<String, dynamic> data = json.decode(readFile('tSource.json'));
      final result = Source.fromJson(data);
      expect(result, tSource);
    });
  });

  group('tesing for articles object', () {
    Source tSource = Source('CNN', 'CNN');
    Articles tArticles = Articles(tSource, 'author', 'title', 'description',
        'url', 'urlToImage', 'publishedAt', 'content');
    test('change data from json to articles object', () {
      final Map<String, dynamic> data = json.decode(readFile('tArticles.json'));
      final result = Articles.fromJson(data);
      expect(result, tArticles);
    });
  });

  group('testing for article object', () {
    Source tSource = Source('CNN', 'CNN');
    Articles tArticles = Articles(tSource, 'author', 'title', 'description',
        'url', 'urlToImage', 'publishedAt', 'content');
    Article tArticle = Article('ok', 1,[tArticles]);
    test('change data from json to article object', () {
      final Map<String, dynamic> data = json.decode(readFile('tArticle.json'));
      final result = Article.fromJson(data);
      expect(result, tArticle);
    });
  });
}
