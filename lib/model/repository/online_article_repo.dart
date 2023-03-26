import 'package:news_app/model/entities/article.dart';
import 'package:news_app/model/repository/article_repo.dart';
import 'package:news_app/model/service/news_api_service.dart';

//Repository for Online Articles
class OnlineArticleRepo implements ArticleRepo {
  final NewsApiService service;  
  OnlineArticleRepo(this.service);
  @override
  //get lists of articles form newsApiService
  Future<List<Articles?>> getArticles(String topic) async {
    Article article = await service.fetchArticle(topic);
    return article.articles;
  }
}
