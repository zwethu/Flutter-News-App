import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/view/screen/home_screen.dart';

void main() {
  testWidgets('test home screen', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: HomeScreen(),
        ),
      ),
    );
    final searchNavigationBar = find.byType(BottomNavigationBar);
    expect(searchNavigationBar, findsOneWidget);
  });
}
