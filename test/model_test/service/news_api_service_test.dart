import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:news_app/model/service/news_api_service.dart';

class MockHttpClient extends Mock implements http.Response{}

void main() {
  MockHttpClient client;
  const String apiKey = "127eda8cc5c148b2a7392a2504e0d56e";
  const String url =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';
  group('test http request from API', () {
    test('return error code when error occur', () {
      client = MockHttpClient();
      
      Uri uri = Uri.parse(Uri.encodeFull(url));
      // when(client.get(uri))
      //     .thenAnswer((_) async => http.Response('Something Wrong', 404));
      
    // expect(() => result, http.Response('Something Wrong', 404));
      
    });
  });
}
