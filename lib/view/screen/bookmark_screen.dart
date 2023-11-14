import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/model/entities/article_response.dart';
import 'package:news_app/view/route/router.gr.dart';
import 'package:news_app/core/styles.dart';
import 'package:news_app/view/widget/author_text.dart';
import 'package:news_app/view/widget/empty_widget.dart';
import 'package:news_app/view/widget/title_text.dart';
import 'package:news_app/view_model/provider/local_data_provider.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

import '../widget/image_frame_widget.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({Key? key}) : super(key: key);

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Hive.deleteFromDisk();
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(8, 16, 8, 24),
                child: Text(
                  'Bookmark',
                  style: logoStyle,
                ),
              ),
            ),
            Expanded(
              child: Consumer<LocalDataProvider>(
                builder: (context, provider, child) {
                  if (provider.list.isEmpty) {
                    return const EmptyWidget(text: 'NO BOOKMARK',);
                  } else {
                    return ListView.builder(
                      // scroll effect from IOS
                      physics: const BouncingScrollPhysics(),
                      itemCount: provider.list.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            final article = Article(
                              Source('', ''),
                              provider.list[index]?.author ?? '',
                              provider.list[index]?.title ?? '',
                              provider.list[index]?.description ?? '',
                              provider.list[index]?.url ?? '',
                              provider.list[index]?.urlToImage ?? '',
                              provider.list[index]?.publishedAt ?? '',
                              provider.list[index]?.content ?? '',
                            );
                            AutoRouter.of(context).push(
                              ArticleScreen(article: article),
                            ); // navigate to Article screen
                          },
                          child: Container(
                            decoration: newsBoxDecoration,
                            height: 150,
                            margin: const EdgeInsets.symmetric(
                              vertical: padding1x,
                              horizontal: padding2x,
                            ),
                            child: Row(
                              children: [
                                // image
                                ImageFrameWidget(
                                  urlToImage:
                                      provider.list[index]?.urlToImage ?? '',
                                  index: index,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      //label
                                      TitleText(
                                        index: index,
                                        title:
                                            provider.list[index]?.title ?? '',
                                      ),
                                      //author
                                      AuthorText(
                                        author:
                                            provider.list[index]?.author ?? '',
                                        index: index,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
