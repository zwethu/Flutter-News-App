import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/model/hive/article_box.dart';

class BookmarkConditionProvider extends ChangeNotifier {
  BookmarkConditionProvider(this.time) {
    checkBookmarkOrNot();
  }
  final String time;
  bool isBookmark = false;

  bool get getBool => isBookmark;

  void checkBookmarkOrNot() {
    List<String> dates = [];
    final box = Hive.box<ArticleBox>(articleBox);
    for (int i = 0; i < box.length; i++) {
      dates.add(box.getAt(i)?.publishedAt ?? '');
    }
    for (int i = 0; i < box.length; i++) {
      if (time == dates[i]) {
        isBookmark = true;
        notifyListeners();
      }
    }
  }
  void changeBool(){
    isBookmark = !isBookmark;
    notifyListeners();
  }
}
