part of 'online_article_bloc.dart';

abstract class OnlineArticleBlocState extends Equatable {
  const OnlineArticleBlocState();

  @override
  List<Object> get props => [];
}

class OnlineArticleBlocInitialState extends OnlineArticleBlocState {}

class OnlineArticleBlocLoadingState extends OnlineArticleBlocState {}

class OnlineArticleBlocLoadedState extends OnlineArticleBlocState {
  final List<Articles?> articleList;
   const OnlineArticleBlocLoadedState(this.articleList);
  @override
  List<Object> get props => [articleList];
}

class OnlineArticleBlocErrorState extends OnlineArticleBlocState {
  final String errorMessage;
  const OnlineArticleBlocErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class OnlineArticleBlocEmptyState extends OnlineArticleBlocState {}

class OnlineArticleBlocNoConnectionState extends OnlineArticleBlocState {}
