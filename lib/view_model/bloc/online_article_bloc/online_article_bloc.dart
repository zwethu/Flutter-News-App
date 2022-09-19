
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/model/entities/article.dart';
import 'package:news_app/model/repository/online_article_repo.dart';
import 'package:http/http.dart' as http;
part 'online_article_bloc_event.dart';
part 'online_article_bloc_state.dart';

class OnlineArticleBloc
    extends Bloc<OnlineArticleBlocEvent, OnlineArticleBlocState> {
  OnlineArticleBloc() : super(OnlineArticleBlocInitialState()) {
    on<GetOnlineArticleBlocEvent>((event, emit) async {
      http.Client client = http.Client();
      OnlineArticleRepo repo = OnlineArticleRepo(client);
      emit(OnlineArticleBlocLoadingState());
      try {
        List<Articles?> articleList = await repo.getArticles();

        emit(OnlineArticleBlocLoadedState(articleList));
      } catch (e) {
        if (e is SocketException) {
          emit(
            const OnlineArticleBlocErrorState('No Internet Connetion!!!'),
          );
        }
      }
    });
  }
}
