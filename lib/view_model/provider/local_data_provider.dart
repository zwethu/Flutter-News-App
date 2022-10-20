import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/model/entities/article.dart';
import 'package:news_app/model/hive/article_box.dart';

class LocalDataProvider extends ChangeNotifier {

  LocalDataProvider(){
    getBookmarkArticle();
  }
  final box = Hive.box<ArticleBox>(articleBox);
  List<ArticleBox?> list = [];

  void getBookmarkArticle() {
    for(int i = 0; i < box.length ; i++){
      list.add(box.getAt(i));
    }
  }

  void bookmarkArticle(Articles article) {
    ArticleBox data = ArticleBox()
      ..author = article.author ?? ''
      ..title = article.title ?? ''
      ..description = article.description ?? ''
      ..url = article.url ?? ''
      ..urlToImage = article.urlToImage ?? ''
      ..publishedAt = article.publishedAt ?? ''
      ..content = article.content ?? '';
    box.add(data);
    list.add(data);
    notifyListeners();
  }

}
