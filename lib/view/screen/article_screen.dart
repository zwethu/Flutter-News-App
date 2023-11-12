import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:news_app/core/colors.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/core/styles.dart';
import 'package:news_app/model/entities/article.dart';
import 'package:news_app/view_model/provider/bookmark_condition_provider.dart';
import 'package:news_app/view_model/provider/local_data_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/button_back.dart';

class ArticleScreen extends StatefulWidget {
  final Article article; // article is required to show data on UI
  const ArticleScreen({Key? key, required this.article}) : super(key: key);

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  String date = ''; // article published date
  String time = ''; // article published time
  bool isMark = false; // boolean for is the articles is bookmarked or not
  @override
  void initState() {
    super.initState();
    convertDateAndTime();
  }

  void convertDateAndTime() {
    // publishedAt string is the mix of date and time. Example - 2022-09-07T15:58:32Z
    // so nned to remove T and Z form the string
    String temp = widget.article.publishedAt!
        .replaceAll('Z', ' '); // replace T from string with space
    temp = temp.replaceAll('T', ' '); // replace Z from string with space
    List<String> tempList = temp.split(' '); // then split string with space
    //first part is date and second is time
    date = tempList[0];
    time = tempList[1];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookmarkConditionProvider>(
      create: (context) =>
          BookmarkConditionProvider(widget.article.publishedAt ?? ''),
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppbar(
                    article: widget.article,
                  ), // appbar with back button and bookmark button
                  const Divider(
                    thickness: 1,
                    color: themeColor,
                  ),
                  TitleWidget(widget: widget), // News title
                  ImageFrame(widget: widget), // Image
                  // show date and time in row
                  DatetimeWidget(
                    date: date,
                    time: time,
                  ),
                  DescriptionWidget(widget: widget), // news description text
                  LinkWidget(
                    url: widget.article.url ?? '',
                  ), // link to the full article
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

//link to see the full article
class LinkWidget extends StatelessWidget {
  final String url; // url is required to follow the link
  const LinkWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: padding1x,
        horizontal: padding2x,
      ),
      child: Row(
        children: [
          const Text(
            'Read full article at Website',
            style: titleStyle,
          ),
          TextButton(
              onPressed: () => followLink(url),
              child: const Text(
                'Click Here',
                style: normalStyle,
              )),
        ],
      ),
    );
  }

// this will make the device open a url in browser
  Future<void> followLink(String input) async {
    if (!await launchUrl(Uri.parse(input))) {
      throw 'Could not launch $input';
    } // throw error if the url is not available or empty
  }
}

// description text of the article
class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ArticleScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(padding2x),
      child: Text(
        '     ${widget.article.description}', // add space for the start of paragraph
        style: titleStyle,
        maxLines: (widget.article.description!.length / 40).round() +
            2, // calculate max line to override textoverflow
      ),
    );
  }
}

//show date and time in the same row
class DatetimeWidget extends StatelessWidget {
  const DatetimeWidget({
    Key? key,
    required this.date,
    required this.time,
  }) : super(key: key);

  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: padding2x,
        vertical: padding1x,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                size: 30,
                color: themeColor,
              ),
              const SizedBox(width: 10),
              Text(date, style: topicStyle),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.schedule_outlined,
                size: 30,
                color: themeColor,
              ),
              const SizedBox(width: 10),
              Text(
                time,
                style: topicStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//article title widget
class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ArticleScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: padding1x,
        horizontal: padding2x,
      ),
      child: Text(
        widget.article.title ?? '',
        style: logoStyle,
        maxLines: 4,
      ),
    );
  }
}

// custom appbar with backbutton and bookmark button
class CustomAppbar extends StatelessWidget {
  final Article article;
  const CustomAppbar({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: padding2x,
        horizontal: padding2x,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const ButtonBack(), //back button
          BookmarkButton(
            article: article,
          ), // bookmark button
        ],
      ),
    );
  }
}

class BookmarkButton extends StatelessWidget {
  final Article article;
  const BookmarkButton({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BookmarkConditionProvider>(
      builder: (context, value, child) {
        return IconButton(
          onPressed: () {
            final dataProvider = context.read<LocalDataProvider>();

            final provider = context.read<BookmarkConditionProvider>();
            if (!provider.getBool) {
              dataProvider.bookmarkArticle(article);
              provider.changeBool();
            }else if(provider.getBool){
              dataProvider.removeBookmark(article);
              provider.changeBool();
            }
          },
          icon: value.isBookmark
              ? const Icon(
                  Icons.bookmark_added_outlined,
                  size: 35,
                  color: themeColor,
                )
              : const Icon(
                  Icons.bookmark_add_outlined,
                  size: 35,
                  color: themeColor,
                ),
        );
      },
    );
  }
}

//Image
class ImageFrame extends StatelessWidget {
  const ImageFrame({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ArticleScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: padding1x,
        horizontal: padding2x,
      ),
      child: Image.network(
        widget.article.urlToImage ?? '',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width -
            32, //subtract (left padding + right padding) to get the same value of width
        fit: BoxFit.cover,
        //show loading animation when image is loading
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const ImageLoadingAnimation();
        },
        //show error widget on error
        errorBuilder: (context, error, stackTrace) {
          return const ImageErrorWidget();
        },
      ),
    );
  }
}

//show the same size of container with Error Icon
class ImageErrorWidget extends StatelessWidget {
  const ImageErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: inactiveColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width - 32,
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

//show custom loading animation with sand glass
class ImageLoadingAnimation extends StatefulWidget {
  const ImageLoadingAnimation({Key? key}) : super(key: key);

  @override
  State<ImageLoadingAnimation> createState() => _ImageLoadingAnimationState();
}

class _ImageLoadingAnimationState extends State<ImageLoadingAnimation>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animController;
  bool isEmpty = false;
  @override
  void initState() {
    super.initState();
    // initialize animationcontroller
    animController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );
    //begin at zero and end at Pi value to get 180 degree
    animation = Tween<double>(
      begin: 0,
      end: math.pi,
    ).animate(animController)
      ..addStatusListener((status) {
        // reverse the animation when its completed
        if (status == AnimationStatus.completed) {
          animController.reverse();
          isEmpty = !isEmpty;
        }
        // do the animation again when its finished
        else if (status == AnimationStatus.dismissed) {
          animController.forward();
          isEmpty = !isEmpty;
        }
      });
    animController.forward(); // initialize the animation
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: inactiveColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width - 32,
      child: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform.rotate(
              angle: animation.value,
              child: Center(
                // show icon according to gravity logic
                child: isEmpty
                    ? const Icon(
                        Icons.hourglass_top_rounded,
                        size: 35,
                        color: themeColor,
                      )
                    : const Icon(
                        Icons.hourglass_bottom_rounded,
                        size: 35,
                        color: themeColor,
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
