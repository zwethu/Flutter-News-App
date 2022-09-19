import 'package:news_app/model/entities/article.dart';
import 'package:news_app/model/repository/article_repo.dart';
import 'package:news_app/model/service/news_api_service.dart';
import 'package:http/http.dart' as http;

class OnlineArticleRepo extends ArticleRepo {
  final http.Client client;
  OnlineArticleRepo(this.client);
  @override
  Future<List<Articles>> getArticles() async {
    Article article = await NewsApiService(client).fetchArticle();
    return article.articles;
  }
}
