import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/model/hive/article_box.dart';
import 'package:news_app/model/repository/bookmark_article_repo.dart';

import 'bookmark_article_repo_test.mocks.dart';



@GenerateMocks([HiveInterface])
void main() {
  group('',()async{
     MockHiveInterface hive = MockHiveInterface();
     BookmarkArticleRepo repo = BookmarkArticleRepo(hive.box<ArticleBox>(articleBox));
    
    // test('testing', (){
    //   when(repo.getArticles('')).thenAnswer((_) => );
    // });
  });
}