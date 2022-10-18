import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/model/entities/article.dart';

import '../../../model/repository/online_article_repo.dart';

part 'online_article_bloc_event.dart';
part 'online_article_bloc_state.dart';

class OnlineArticleBloc
    extends Bloc<OnlineArticleBlocEvent, OnlineArticleBlocState> {
  final OnlineArticleRepo repo;
  OnlineArticleBloc(this.repo) : super(OnlineArticleBlocInitialState()) {
    on<GetOnlineArticleBlocEvent>(
      (event, emit) async {
        // emit loading state during fetching data
        emit(OnlineArticleBlocLoadingState());
        try {
          List<Articles?> articleList = await repo.getArticles(event.topic);
          // emit loaded state if fetching data is completed and no error occured
          emit(OnlineArticleBlocLoadedState(articleList));
        } catch (e) {
          // emit network error when socketexception occured
          if (e is SocketException) {
            emit(
              OnlineArticleBlocNoConnectionState(),
            );
          }
          // emit error when error occured
          else {
            emit(
              OnlineArticleBlocErrorState(e.toString()),
            );
          }
        }
      },
    );
    on<ResetOnlineArticleBlocEvent>((event, emit) async {
      emit(OnlineArticleBlocInitialState());
    });
  }
}
