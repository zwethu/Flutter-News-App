import 'package:news_app/model/entities/article_response.dart';
abstract class ApiService{
   Future<ArticleResponse> fetchArticle(String topic);
}