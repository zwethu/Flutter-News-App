import 'package:news_app/model/entities/article.dart';
import 'package:news_app/model/repository/online_article_repo.dart';
import 'package:news_app/model/service/news_api_service.dart';

//Repository for Online Articles
class OnlineArticleRepoImp implements OnlineArticleRepo {
  final NewsApiService service;  
  OnlineArticleRepoImp(this.service);
  @override
  //get lists of articles form newsApiService
  Future<List<Article?>> getArticles(String topic) async {
    ArticleResponse article = await service.fetchArticle(topic);
    return article.articles;
  }
}
