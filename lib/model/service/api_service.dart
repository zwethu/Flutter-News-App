import 'package:news_app/model/entities/article.dart';
abstract class ApiService{
   Future<ArticleResponse> fetchArticle(String topic);
}