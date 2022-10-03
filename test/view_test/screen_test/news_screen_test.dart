import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/view/screen/news_screen.dart';

void main() {
  testWidgets('test NewsScreen', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: NewsScreen(),
        ),
      ),
    );
    final searchLogo = find.text('News');
    final searchTabBar = find.byType(TabBar);
    final findSearchIcon = find.byIcon(Icons.search_outlined);
    final findTabs = find.byType(Tab);
    expect(searchLogo, findsOneWidget);
    expect(searchTabBar, findsOneWidget);
    expect(findTabs, findsNWidgets(5));
    expect(findSearchIcon, findsOneWidget);
  });
}
