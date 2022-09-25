import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/model/entities/article.dart';
import 'package:news_app/model/repository/online_article_repo.dart';
part 'online_article_bloc_event.dart';
part 'online_article_bloc_state.dart';

class OnlineArticleBloc
    extends Bloc<OnlineArticleBlocEvent, OnlineArticleBlocState> {
  final OnlineArticleRepo repo;
  OnlineArticleBloc(this.repo) : super(OnlineArticleBlocInitialState()) {
    on<GetOnlineArticleBlocEvent>((event, emit) async {
      emit(OnlineArticleBlocLoadingState());
      try {
        List<Articles?> articleList = await repo.getArticles(event.topic);

        emit(OnlineArticleBlocLoadedState(articleList));
      } catch (e) {
        if (e is SocketException) {
          emit(
            OnlineArticleBlocNoConnectionState(),
          );
        }
        else {
          emit(
            OnlineArticleBlocErrorState(e.toString()),
          );
        }
      }
    });
  }
}
