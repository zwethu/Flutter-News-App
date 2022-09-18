import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/model/entities/article.dart';
import 'package:news_app/model/service/news_api_service.dart';
import 'package:http/http.dart' as http;

import '../../test_sources/file_reader.dart';
import 'news_api_service_test.mocks.dart' as client;

@GenerateMocks([NewsApiService, http.Client])
void main() {
  group('check client response from api', () {
    const String apiKey = "127eda8cc5c148b2a7392a2504e0d56e";
    const String url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';
    Uri uri = Uri.parse(Uri.encodeFull(url));
    client.MockClient mClient = client.MockClient();
    test('return 200', () async {
      when(mClient.get(uri)).thenAnswer(
        (_) async => http.Response(readFile('tArticle.json'), 200),
      );

      http.Response result = await mClient.get(uri);
      expect(result, isA<http.Response>());
    });
    test('return error code', () async {
      when(mClient.get(uri)).thenAnswer(
        (_) async => http.Response('Something went wrong!!!', 404),
      );

      http.Response result = await mClient.get(uri);
      expect(result, isA<http.Response>());
    });
  });
  group('check fetchArticle function', () {
    client.MockNewsApiService service = client.MockNewsApiService();
    test('return article object', () async {
      when(service.fetchArticle()).thenAnswer(
        (_) async => Article.fromJson(
          jsonDecode(
            readFile('tArticle.json'),
          ),
        ),
      );
      final result = await service.fetchArticle();
      expect(result, isA<Article>());
    });
    test('return exception', () async {
      when(service.fetchArticle()).thenThrow(Exception(404));
      expect(
        () async => await service.fetchArticle(),
        throwsA(
          isA<Exception>(),
        ),
      );
    });
  });

}
