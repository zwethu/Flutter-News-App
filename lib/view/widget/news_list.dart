import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/core/styles.dart';
import 'package:news_app/view/route/router.gr.dart';
import 'package:news_app/view/widget/author_text.dart';
import 'package:news_app/view/widget/image_frame.dart';
import 'package:news_app/view/widget/title_text.dart';
import 'package:news_app/view_model/bloc/online_article_bloc/online_article_bloc.dart';

class NewsList extends StatelessWidget {
  final OnlineArticleBlocLoadedState state;
  const NewsList({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // scroll effect from IOS
      physics: const BouncingScrollPhysics(),
      itemCount: state.articleList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            AutoRouter.of(context).push(
              ArticleScreen(
                article: state.articleList[index]!,
              ),
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
                ImageFrame(
                  urlToImage: state.articleList[index]?.urlToImage ?? '',
                  index: index,
                ),
                Expanded(
                  child: Column(
                    children: [
                      //label
                      TitleText(
                        index: index,
                        title: state.articleList[index]?.title ?? '',
                      ),
                      //author
                      AuthorText(
                        author: state.articleList[index]?.author ?? '',
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
}

// image error widget with error icon
class ImageErrorWidget extends StatelessWidget {
  const ImageErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: inactiveColor,
      width: 150,
      height: 150,
      child: const Center(
        child: Icon(
          Icons.error,
          size: 35,
          color: themeColor,
        ),
      ),
    );
  }
}

// show normal circular progress indicator with sizedbox
class ImageLoadingWidget extends StatelessWidget {
  const ImageLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 150,
      height: 150,
      child: Center(
        child: CircularProgressIndicator(
          color: themeColor,
        ),
      ),
    );
  }
}
