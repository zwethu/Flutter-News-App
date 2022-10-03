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
    ); // add get onlne article bloc event to online article bloc
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnlineArticleBloc, OnlineArticleBlocState>(
      builder: (context, state) {
        if (state is OnlineArticleBlocInitialState) {
          //return loading animtion at initial state
          return const LoadingAnimation();
        } else if (state is OnlineArticleBlocLoadingState) {
          //return loading animation at loading state
          return const LoadingAnimation();
        } else if (state is OnlineArticleBlocEmptyState) {
          // return placeholder when data is empty (empty state)
          return const Placeholder(color: Colors.red);
        } else if (state is OnlineArticleBlocLoadedState) {
          // return list of news when loading is completed(loaded)
          return NewsList(state: state);
        } else if (state is OnlineArticleBlocNoConnectionState) {
          //return connection error widget when there is no internet
          return const NoInternetWidget();
        } else if (state is OnlineArticleBlocErrorState) {
          //return error widget when error occcured
          return const ErrorWidget();
        } else {
          // return loading animation for unexpected condition
          return const Placeholder();
        }
      },
    );
  }
}

//error widget with error icon
class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.error_outline,
        size: 35,
        color: themeColor,
      ),
    );
  }
}

// custom loadinh animation with sand glass
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
    return AnimatedBuilder(
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
    );
  }
}

//show no internet widget
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
