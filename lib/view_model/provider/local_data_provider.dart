import 'package:flutter/cupertino.dart';
import 'package:news_app/model/entities/article_response.dart';
import 'package:news_app/model/hive/article_box.dart';
import 'package:news_app/model/repository/bookmark_article_repo.dart';

class LocalDataProvider extends ChangeNotifier {
   final BookmarkArticleRepoImp repo;
  LocalDataProvider(this.repo) {
    getBookmarkArticle();
  }
 
  List<ArticleBox?> list = [];

  void getBookmarkArticle() {
    list = repo.getArticles('bookmark');
  }

  void bookmarkArticle(Article article) {
    ArticleBox data = ArticleBox()
      ..author = article.author ?? ''
      ..title = article.title ?? ''
      ..description = article.description ?? ''
      ..url = article.url ?? ''
      ..urlToImage = article.urlToImage ?? ''
      ..publishedAt = article.publishedAt ?? ''
      ..content = article.content ?? '';
    repo.saveInHive(data);
    list.add(data);
    notifyListeners();
  }

  void removeBookmark(Article article) {
    ArticleBox data = ArticleBox()
      ..author = article.author ?? ''
      ..title = article.title ?? ''
      ..description = article.description ?? ''
      ..url = article.url ?? ''
      ..urlToImage = article.urlToImage ?? ''
      ..publishedAt = article.publishedAt ?? ''
      ..content = article.content ?? '';
    repo.removeFromHive(data);
    getBookmarkArticle();
    list.remove(data);
    notifyListeners();
  }
}
