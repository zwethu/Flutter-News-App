import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:news_app/model/entities/article_response.dart';
import 'package:news_app/model/service/api_service.dart';

class NewsApiService implements ApiService {
  final http.Client client;
  NewsApiService(this.client); // require Client for testing purpose

// fetch response from api
  @override
  Future<ArticleResponse> fetchArticle(String topic) async {
    final String url =
        'https://newsapi.org/v2/everything?q=$topic&apiKey=127eda8cc5c148b2a7392a2504e0d56e';
    Uri uri = Uri.parse(Uri.encodeFull(url));
    http.Response response = await client.get(uri);
    try {
      if (response.statusCode == 200) {
        //return data when response status is good
        return ArticleResponse.fromJson(
          jsonDecode(response.body),
        ); // change json type response body to Article object
      } else {
        // throw exception when response status is not good
        throw Exception(response.statusCode);
      }
    } on SocketException // throw socket exception when there is no internet connection
    {
      throw Exception('No internet Connection');
    }
  }
}
