import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/core/styles.dart';
import 'package:news_app/view/widget/custom_news_tab.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(),
          TabBarTitle(controller: controller),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: controller,
              children: const [
                CustomNewsTab(topic: 'trending'),
                CustomNewsTab(topic: 'entertainment'),
                CustomNewsTab(topic: 'health'),
                CustomNewsTab(topic: 'sports'),
                CustomNewsTab(topic: 'programming'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
            onPressed: () {},
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
