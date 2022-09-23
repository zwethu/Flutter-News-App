import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/core/styles.dart';
import 'package:news_app/view/route/router.gr.dart';
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
      physics: const BouncingScrollPhysics(),
      itemCount: state.articleList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            AutoRouter.of(context).push(
              ArticleScreen(
                article: state.articleList[index]!,
              ),
            );
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
                ImageFrame(
                  state: state,
                  index: index,
                ),
                Expanded(
                  child: Column(
                    children: [
                      TitleText(
                        state: state,
                        index: index,
                      ),
                      AuthorText(
                        state: state,
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

class TitleText extends StatelessWidget {
  final int index;
  const TitleText({
    Key? key,
    required this.state,
    required this.index,
  }) : super(key: key);

  final OnlineArticleBlocLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      padding: const EdgeInsets.all(padding1x),
      child: Text(
        state.articleList[index]?.title ?? '',
        maxLines: 4,
        style: titleStyle,
      ),
    );
  }
}

class AuthorText extends StatelessWidget {
  final int index;
  const AuthorText({
    Key? key,
    required this.state,
    required this.index,
  }) : super(key: key);

  final OnlineArticleBlocLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      height: 25,
      padding: const EdgeInsets.symmetric(horizontal: padding1x),
      child: Text(
        state.articleList[index]?.author ?? 'Unknown',
        maxLines: 1,
        style: normalStyle,
      ),
    );
  }
}

class ImageFrame extends StatelessWidget {
  final int index;
  const ImageFrame({
    Key? key,
    required this.state,
    required this.index,
  }) : super(key: key);

  final OnlineArticleBlocLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Image.network(state.articleList[index]?.urlToImage ?? '',
        width: 150,
        height: 150,
        fit: BoxFit.cover, loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) return child;
      return const ImageLoadingWidget();
    }, errorBuilder: (context, error, stackTrace) {
      return const ImageErrorWidget();
    });
  }
}

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
