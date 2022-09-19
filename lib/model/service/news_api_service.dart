import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:news_app/model/entities/article.dart';
import 'package:news_app/model/service/api_service.dart';

class NewsApiService extends ApiService {
  NewsApiService(super.client);

  static const String apiKey = "127eda8cc5c148b2a7392a2504e0d56e";
  final String url =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';

  Future<Article> fetchArticle() async {
    Uri uri = Uri.parse(Uri.encodeFull(url));
    http.Response response = await client.get(uri);
    try {
      if (response.statusCode == 200) {
        return Article.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(response.statusCode);
      }
    } on SocketException {
      throw Exception('No internet Connection');
    }
  }
}
