import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view/widget/custom_error_widget.dart';
import 'package:news_app/view/widget/empty_widget.dart';
import 'package:news_app/view/widget/loading_animation.dart';
import 'package:news_app/view/widget/news_list.dart';
import 'package:news_app/view/widget/no_internet_widget.dart';
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
          return const EmptyWidget(text: 'NO RESULT');
        } else if (state is OnlineArticleBlocLoadedState) {
          // return list of news when loading is completed(loaded)
          return NewsList(state: state);
        } else if (state is OnlineArticleBlocNoConnectionState) {
          //return connection error widget when there is no internet
          return const NoInternetWidget();
        } else if (state is OnlineArticleBlocErrorState) {
          //return error widget when error occcured
          return const CustomErrorWidget();
        } else {
          // return loading animation for unexpected condition
          return const LoadingAnimation();
        }
      },
    );
  }
}
