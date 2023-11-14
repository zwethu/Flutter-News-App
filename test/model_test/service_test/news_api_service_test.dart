import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:news_app/model/entities/article_response.dart';
import 'package:news_app/model/service/news_api_service.dart';

import '../../test_sources/file_reader.dart';
import 'news_api_service_test.mocks.dart' as mock;

@GenerateMocks([http.Client])
void main() {
  mock.MockClient client;
  NewsApiService service;
  group('fetch data from api - ', () {
    client = mock.MockClient();
    service = NewsApiService(client);
    test('return article object when api response is 200\n', () async {
      when(client.get(any)).thenAnswer(
        (_) async => http.Response(readFile('tArticle.json'), 200),
      );
      final result = await service.fetchArticle('topic');
      expect(result, isA<ArticleResponse>());
      verify(client.get(any)).called(1);
      expect(
        result,
        equals(
          ArticleResponse.fromJson(
            json.decode(
              readFile('tArticle.json'),
            ),
          ),
        ),
      );
    });
    test('return exception when api response is not 200', () async {
      when(client.get(any)).thenAnswer(
          (realInvocation) async => http.Response('Not founded', 404));
      expect(service.fetchArticle('topic'), throwsException);
    });
  });
}
