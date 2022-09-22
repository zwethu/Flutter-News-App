import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/core/styles.dart';
import 'package:news_app/model/entities/article.dart';

class ArticleScreen extends StatefulWidget {
  final Articles article;
  const ArticleScreen({Key? key, required this.article}) : super(key: key);

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  bool isMark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: padding3x,
                  horizontal: padding2x,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        AutoRouter.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 35,
                        color: themeColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark_add_outlined,
                        size: 35,
                        color: themeColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                color: themeColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: padding1x,
                  horizontal: padding2x,
                ),
                child: Text(
                  widget.article.title ?? '',
                  style: logoStyle,
                  maxLines: 4,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: padding1x,
                  horizontal: padding2x,
                ),
                child: Image.network(
                  widget.article.urlToImage ?? '',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const ImageErrorWidget();
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const ImageErrorWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageErrorWidget extends StatelessWidget {
  const ImageErrorWidget({Key? key}) : super(key: key);

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
