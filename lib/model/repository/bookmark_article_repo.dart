import 'package:hive/hive.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/model/hive/article_box.dart';
import 'package:news_app/model/repository/article_repo.dart';

class BookmarkArticleRepo extends ArticleRepo {
  @override
  List<ArticleBox?> getArticles(String topic) {
    List<ArticleBox?> dataList = [];
    final box = Hive.box<ArticleBox>(articleBox);
    for (int i = 0; i < box.length; i++) {
      dataList.add(box.getAt(i));
    }
    return dataList;
  }
}
