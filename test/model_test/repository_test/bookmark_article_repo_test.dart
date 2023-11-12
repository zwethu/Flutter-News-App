import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/model/hive/article_box.dart';
import 'package:news_app/model/repository/bookmark_article_repo.dart';

import 'bookmark_article_repo_test.mocks.dart';

@GenerateMocks([Box<ArticleBox>])
void main() {
  MockBox<ArticleBox> box = MockBox<ArticleBox>();
  BookmarkArticleRepoImp repo = BookmarkArticleRepoImp(box);
  ArticleBox data = ArticleBox()
    ..author = "author"
    ..title = "title"
    ..description = "description"
    ..url = "url"
    ..urlToImage = "urlToImage"
    ..publishedAt = "publishedAt"
    ..content = "content";
    
  group('test getArticles method', () {
    test('return [] when Hive box is empty.', () {
      when(box.length).thenAnswer((_) => 0);
      final result = repo.getArticles('');
      expect(result, []);
      verify(repo.getArticles(''));
    });
    test('return [<ArticleBox>,...] when hive has data', () {
      when(box.length).thenAnswer((_) => 2);
      when(box.getAt(any)).thenAnswer((_) => data);
      final result = repo.getArticles('');
      expect([data, data], result);
    });
  });
  test('test remove function from hive function', () {
    ArticleBox dataToDelete = ArticleBox()
      ..author = "author"
      ..title = "title"
      ..description = "description"
      ..url = "url"
      ..urlToImage = "urlToImage"
      ..publishedAt = "publishedAt"
      ..content = "content";
    when(box.length).thenAnswer((_) => 2);
    when(box.getAt(0)).thenAnswer((_) => data);
    when(box.getAt(1)).thenAnswer((realInvocation) => dataToDelete);
    repo.removeFromHive(dataToDelete);
    verify(box.deleteAt(1));
  });
}
