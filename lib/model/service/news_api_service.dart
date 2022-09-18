import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/entities/article.dart';

class NewsApiService {
  static const String apiKey = "127eda8cc5c148b2a7392a2504e0d56e";
  final String url =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';

  Future<Article> fetchArticle() async {
    Uri uri = Uri.parse(Uri.encodeFull(url));
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return Article.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
