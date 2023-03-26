import 'package:hive/hive.dart';
import 'package:news_app/model/hive/article_box.dart';
import 'package:news_app/model/repository/article_repo.dart';

class BookmarkArticleRepo implements ArticleRepo {
  final Box<ArticleBox> box;
  BookmarkArticleRepo(this.box);

  @override
  List<ArticleBox?> getArticles(String topic) {
    List<ArticleBox?> dataList = [];
    for (int i = 0; i < box.length; i++) {
      dataList.add(box.getAt(i));
    }
    return dataList;
  }

  void saveInHive(ArticleBox article) {
    box.add(article);
  }

  List<ArticleBox?> removeFromHive(ArticleBox article) {
    for (int i = 0; i < box.length; i++) {
      if (box.getAt(i)?.publishedAt == article.publishedAt) {
        box.deleteAt(i);
      }
    }
    return getArticles('bookmark');
  }
}
