import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/core/styles.dart';
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
          return const Placeholder(color: Colors.amber);
        } else if (state is OnlineArticleBlocLoadingState) {
          return const Placeholder(color: Colors.red);
        } else if (state is OnlineArticleBlocEmptyState) {
          return const Placeholder(color: Colors.green);
        } else if (state is OnlineArticleBlocLoadedState) {
          return NewsList(state: state);
        } else if (state is OnlineArticleBlocErrorState) {
          return const Placeholder();
        } else if (state is OnlineArticleBlocNoConnectionState) {
          return const Placeholder();
        } else {
          return const Placeholder();
        }
      },
    );
  }
}

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
        return Container(
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
    return Image.network(
      state.articleList[index]?.urlToImage ?? '',
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    );
  }
}
