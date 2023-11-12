import 'package:news_app/model/hive/article_box.dart';

abstract class BookmarkArticleRepo{
  List<ArticleBox?> getArticles(String topic);
  void saveInHive(ArticleBox article);
  List<ArticleBox?> removeFromHive(ArticleBox article);
}