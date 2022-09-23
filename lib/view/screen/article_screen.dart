import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:news_app/core/colors.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/core/styles.dart';
import 'package:news_app/model/entities/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleScreen extends StatefulWidget {
  final Articles article;
  const ArticleScreen({Key? key, required this.article}) : super(key: key);

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  String date = '';
  String time = '';
  bool isMark = false;
  @override
  void initState() {
    super.initState();
    String temp = widget.article.publishedAt!.replaceAll('Z', ' ');
    temp = temp.replaceAll('T', ' ');
    List<String> tempList = temp.split(' ');
    date = tempList[0];
    time = tempList[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppbar(),
              const Divider(
                thickness: 1,
                color: themeColor,
              ),
              TitleWidget(widget: widget),
              ImageFrame(widget: widget),
              DatetimeWidget(
                date: date,
                time: time,
              ),
              DescriptionWidget(widget: widget),
              LinkWidget(url: widget.article.url ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}

class LinkWidget extends StatelessWidget {
  final String url;
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

  Future<void> followLink(String input) async {
    if (!await launchUrl(Uri.parse(input))) {
      throw 'Could not launch $input';
    }
  }
}

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
        '     ${widget.article.description}',
        style: titleStyle,
        maxLines: (widget.article.description!.length / 40).round() + 2,
      ),
    );
  }
}

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

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    Key? key,
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
        children: const [
          ButtonBack(),
          BookmarkButton(),
        ],
      ),
    );
  }
}

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.bookmark_add_outlined,
        size: 35,
        color: themeColor,
      ),
    );
  }
}

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        AutoRouter.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_back_ios_rounded,
        size: 35,
        color: themeColor,
      ),
    );
  }
}

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
        height: MediaQuery.of(context).size.width - 32,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const ImageLoadingAnimation();
        },
        errorBuilder: (context, error, stackTrace) {
          return const ImageErrorWidget();
        },
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
    animController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: math.pi,
    ).animate(animController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animController.reverse();
          isEmpty = !isEmpty;
        } else if (status == AnimationStatus.dismissed) {
          animController.forward();
          isEmpty = !isEmpty;
        }
      });
    animController.forward();
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
