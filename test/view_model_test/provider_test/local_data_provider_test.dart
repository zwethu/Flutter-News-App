import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/model/hive/article_box.dart';
import 'package:news_app/model/repository/bookmark_article_repo.dart';
import 'package:news_app/view_model/provider/local_data_provider.dart';
import 'local_data_provider_test.mocks.dart';

@GenerateMocks([BookmarkArticleRepo])
void main() {
  final MockBookmarkArticleRepo repo = MockBookmarkArticleRepo();
  final LocalDataProvider provider = LocalDataProvider(repo);
  ArticleBox data = ArticleBox()
    ..author = "author"
    ..title = "title"
    ..description = "description"
    ..url = "url"
    ..urlToImage = "urlToImage"
    ..publishedAt = "publishedAt"
    ..content = "content";
  group("test getBOOKmarkArticle", () {
    // test("return [] when there is no data", () {
    //   when(repo.getArticles('bookmark')).thenAnswer((_) => []);
    //   provider.getBookmarkArticle();
    //   verify(repo.getArticles(any));
    // });
    test("return list of Article", () {
      when(repo.getArticles('bookmark')).thenAnswer((_) => [data]);
      provider.getBookmarkArticle();
     
    });
  });
}
