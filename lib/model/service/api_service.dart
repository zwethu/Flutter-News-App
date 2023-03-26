import 'package:news_app/model/entities/article.dart';
abstract class ApiService{
   Future<Article> fetchArticle(String topic);
}