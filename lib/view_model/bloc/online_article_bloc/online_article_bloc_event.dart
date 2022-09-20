part of 'online_article_bloc.dart';

abstract class OnlineArticleBlocEvent extends Equatable {
  const OnlineArticleBlocEvent();

  @override
  List<Object> get props => [];
}

class GetOnlineArticleBlocEvent extends OnlineArticleBlocEvent {
  final String topic;
  const GetOnlineArticleBlocEvent(this.topic);
  @override
  List<Object> get props => [topic];
}
