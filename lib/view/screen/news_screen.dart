import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/core/styles.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/repository/online_article_repo_imp.dart';
import 'package:news_app/model/service/news_api_service.dart';
import 'package:news_app/view/route/router.gr.dart';
import 'package:news_app/view/widget/custom_news_tab.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> 
    with SingleTickerProviderStateMixin {
  late TabController controller;
  late NewsApiService service;
  late OnlineArticleRepoImp repo;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
    http.Client client = http.Client();
    service = NewsApiService(client);
    repo = OnlineArticleRepoImp(service);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(), //app bar with news logo and search button
          TabBarTitle(controller: controller), // tab bar menu
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),// disable moving tab by swiping the tab bar view
              controller: controller,
              children: const [
                CustomNewsTab(
                  topic: 'trending',
                ),
                CustomNewsTab(
                  topic: 'entertainment',
                ),
                CustomNewsTab(
                  topic: 'health',
                ),
                CustomNewsTab(
                  topic: 'sports',
                ),
                CustomNewsTab(
                  topic: 'programming',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// tab bar menu
class TabBarTitle extends StatelessWidget {
  const TabBarTitle({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      labelColor: themeColor,
      labelStyle: topicStyle,
      unselectedLabelColor: inactiveColor,
      unselectedLabelStyle: titleStyle,
      indicatorColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      controller: controller,
      tabs: const [
        Tab(text: 'Treding'),
        Tab(text: 'Entertainment'),
        Tab(text: 'Health'),
        Tab(text: 'Sports'),
        Tab(text: 'Programming'),
      ],
    );
  }
}

 // custom app bar with news logo and search button
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding2x),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'News',
            style: logoStyle,
          ),
          IconButton(
            onPressed: () {
              
              AutoRouter.of(context).popAndPush(const SearchScreen());
            },
            icon: const Icon(
              Icons.search_outlined,
              size: 35,
              color: inactiveColor,
            ),
          ),
        ],
      ),
    );
  }
}
