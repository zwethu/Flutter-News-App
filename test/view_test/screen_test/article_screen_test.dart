import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/model/entities/article.dart';
import 'package:news_app/model/hive/article_box.dart';
import 'package:news_app/view/screen/article_screen.dart';
import 'package:news_app/view_model/provider/bookmark_condition_provider.dart';
import 'package:provider/provider.dart';

void main() {
  setUp(
    () async {
      await Hive.initFlutter();
      // register hive adapter
      Hive.registerAdapter(ArticleBoxAdapter());
      // open hive
      await Hive.openBox<ArticleBox>(articleBox);
    },
  );
  testWidgets(
    'test article screen',
    (tester) async {
      Source source = Source('id', 'name');
      Articles article = Articles(
        source,
        'author',
        'title',
        'description',
        'url',
        'urlToImage',
        '2022-09-07T15:58:32Z',
        'content',
      );

      await tester.pumpWidget(
        ChangeNotifierProvider<BookmarkConditionProvider>(
          create: (context) =>
              BookmarkConditionProvider('2022-09-07T15:58:32Z'),
          builder: (context, child) => MaterialApp(
            home: Scaffold(
              body: ArticleScreen(
                article: article,
              ),
            ),
          ),
        ),
      );

      final searchReadArticleText = find.text('Read full article at Website');
      final searchClickButton = find.text('Click Here');
      final searchDescription = find.byType(DescriptionWidget);
      final searchImage = find.byType(Image);
      final searchDate = find.text('2022-09-07');
      final searchTime = find.text('15:58:32');
      final searchBackButton = find.byIcon(Icons.arrow_back_ios_rounded);
      final searchBookmarkButton = find.byIcon(Icons.bookmark_add_outlined);
      final searchTitle = find.text('title');
      expect(searchReadArticleText, findsOneWidget);
      expect(searchClickButton, findsOneWidget);
      expect(searchDescription, findsOneWidget);
      expect(searchImage, findsOneWidget);
      expect(searchDate, findsOneWidget);
      expect(searchTime, findsOneWidget);
      expect(searchBackButton, findsOneWidget);
      expect(searchBookmarkButton, findsOneWidget);
      expect(searchTitle, findsOneWidget);
    },
  );
}
