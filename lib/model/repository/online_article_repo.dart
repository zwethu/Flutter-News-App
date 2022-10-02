import 'package:news_app/model/entities/article.dart';
import 'package:news_app/model/repository/article_repo.dart';
import 'package:news_app/model/service/news_api_service.dart';
import 'package:http/http.dart' as http;

//Repository for Online Articles
class OnlineArticleRepo extends ArticleRepo {
  final http.Client client;
  OnlineArticleRepo(this.client);
  @override
  //get lists of articles form newsApiService
  Future<List<Articles?>> getArticles(String topic) async {
    Article article = await NewsApiService(client).fetchArticle(topic);
    return article.articles;
  }
}
