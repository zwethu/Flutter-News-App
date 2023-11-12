import 'package:hive/hive.dart';
import 'package:news_app/model/hive/article_box.dart';
import 'package:news_app/model/repository/bookmark_article.dart';

class BookmarkArticleRepoImp implements BookmarkArticleRepo {
  final Box<ArticleBox?> box;
  BookmarkArticleRepoImp(this.box);

  @override
  List<ArticleBox?> getArticles(String topic) {
    List<ArticleBox?> dataList = [];
    for (int i = 0; i < box.length; i++) {
      dataList.add(box.getAt(i));
    }
    return dataList;
  }

  @override
  void saveInHive(ArticleBox article) {
    box.add(article);
  }

  @override
  List<ArticleBox?> removeFromHive(ArticleBox article) {
    for (int i = 0; i < box.length; i++) {
      if (box.getAt(i)?.publishedAt == article.publishedAt) {
        box.deleteAt(i);
      }
    }
    return getArticles('bookmark');
  }
}
