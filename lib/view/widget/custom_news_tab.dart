import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/view/widget/news_list.dart';
import 'package:news_app/view_model/bloc/online_article_bloc/online_article_bloc.dart';

class CustomNewsTab extends StatefulWidget {
  final String topic;
  const CustomNewsTab({Key? key, required this.topic}) : super(key: key);

  @override
  State<CustomNewsTab> createState() => _CustomNewsTabState();
}

class _CustomNewsTabState extends State<CustomNewsTab> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OnlineArticleBloc>(context).add(
      GetOnlineArticleBlocEvent(widget.topic),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnlineArticleBloc, OnlineArticleBlocState>(
      builder: (context, state) {
        if (state is OnlineArticleBlocInitialState) {
          return const LoadingAnimation();
        } else if (state is OnlineArticleBlocLoadingState) {
          return const LoadingAnimation();
        } else if (state is OnlineArticleBlocEmptyState) {
          return const Placeholder(color: Colors.green);
        } else if (state is OnlineArticleBlocLoadedState) {
          return NewsList(state: state);
        } else if (state is OnlineArticleBlocErrorState) {
          return const LoadingAnimation();
        } else if (state is OnlineArticleBlocNoConnectionState) {
          return const NoInternetWidget();
        } else {
          return const LoadingAnimation();
        }
      },
    );
  }
}

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
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
    return AnimatedBuilder(
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
    );
  }
}

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.signal_wifi_bad_rounded,
        size: 35,
        color: themeColor,
      ),
    );
  }
}
