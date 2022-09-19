import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view_model/bloc/online_article_bloc/online_article_bloc.dart';

class CustomNewsTab extends StatefulWidget {
  const CustomNewsTab({Key? key}) : super(key: key);

  @override
  State<CustomNewsTab> createState() => _CustomNewsTabState();
}

class _CustomNewsTabState extends State<CustomNewsTab> {
  @override
  void initState() {
    super.initState();
     BlocProvider.of<OnlineArticleBloc>(context).add(GetOnlineArticleBlocEvent());
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
          
          return ListView.builder(
            itemCount: state.articleList.length,
            itemBuilder: (context,index){
              print(index);
            return Text(state.articleList[index]?.description??'');
          });
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
