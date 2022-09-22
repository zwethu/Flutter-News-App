import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/view/screen/favourites_screen.dart';
import 'package:news_app/view_model/bloc/provider/navigation_bar_provider.dart';
import 'package:provider/provider.dart';
import 'news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final pages = const [
    NewsScreen(),
    BookMarkScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NavigationBarProvider>(
      create: (context) => NavigationBarProvider(),
      builder: (context, child) {
        return Consumer<NavigationBarProvider>(
            builder: (context, provider, child) {
          return Scaffold(
            body: Container(child: pages[provider.currentIndex],),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                provider.setIndex(value);
              },
              selectedItemColor: themeColor,
              unselectedItemColor: inactiveColor,
              currentIndex: provider.currentIndex,
              iconSize: 35,
              items: items,
            ),
          );
        });
      },
    );
  }

  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.newspaper_outlined),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark_outlined),
      label: '',
    ),
  ];
}