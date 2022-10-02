part of 'online_article_bloc.dart';

abstract class OnlineArticleBlocState extends Equatable {
  const OnlineArticleBlocState();

  @override
  List<Object> get props => [];
}

// initial state
class OnlineArticleBlocInitialState extends OnlineArticleBlocState {}

// loading state
class OnlineArticleBlocLoadingState extends OnlineArticleBlocState {}

// loaded state
class OnlineArticleBlocLoadedState extends OnlineArticleBlocState {
  final List<Articles?> articleList;
  const OnlineArticleBlocLoadedState(this.articleList);
  @override
  List<Object> get props => [articleList];
}

// error state
class OnlineArticleBlocErrorState extends OnlineArticleBlocState {
  final String errorMessage;
  const OnlineArticleBlocErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

// empty state
class OnlineArticleBlocEmptyState extends OnlineArticleBlocState {}

// no internet state
class OnlineArticleBlocNoConnectionState extends OnlineArticleBlocState {}
