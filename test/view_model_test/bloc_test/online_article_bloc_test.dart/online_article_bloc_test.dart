import 'dart:convert';
import 'dart:io';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/model/entities/article.dart';
import 'package:news_app/model/repository/online_article_repo.dart';
import 'package:news_app/view_model/bloc/online_article_bloc/online_article_bloc.dart';
import '../../../test_sources/file_reader.dart';
import 'online_article_bloc_test.mocks.dart';

@GenerateMocks([OnlineArticleRepo])
void main() {
  group(
    'test OnlineArticleBLoc - ',
    () {
      MockOnlineArticleRepo repo = MockOnlineArticleRepo();
      blocTest(
        'return [] at initial state',
        build: () => OnlineArticleBloc(repo),
        expect: () => [],
      );
      blocTest(
        'return [loading state and error state] when getOnlineArticleEvent is passed with blank argument',
        build: () => OnlineArticleBloc(repo),
        act: (OnlineArticleBloc bloc) =>
            bloc.add(const GetOnlineArticleBlocEvent('')),
        expect: () => [
          OnlineArticleBlocLoadingState(),
          isA<OnlineArticleBlocErrorState>(),
        ],
      );
      blocTest(
        'return [loading state and loaded state] when getOnlineArticleEvent is passed with argument',
        build: () => OnlineArticleBloc(repo),
        setUp: () {
          when(repo.getArticles(any)).thenAnswer(
            (_) async => [
              Articles.fromJson(
                json.decode(
                  readFile('tArticles.json'),
                ),
              ),
            ],
          );
        },
        act: (OnlineArticleBloc bloc) => bloc.add(
          const GetOnlineArticleBlocEvent('trending'),
        ),
        expect: () => [
          OnlineArticleBlocLoadingState(),
          isA<OnlineArticleBlocLoadedState>(),
        ],
      );
      blocTest(
        'return [loading state and no internet state] when there is no connection.',
        build: () => OnlineArticleBloc(repo),
        setUp: () {
          when(repo.getArticles(any)).thenThrow(const SocketException(''));
        },
        act: (OnlineArticleBloc bloc) => bloc.add(
          const GetOnlineArticleBlocEvent('trending'),
        ),
        expect: () => [
          OnlineArticleBlocLoadingState(),
          OnlineArticleBlocNoConnectionState(),
        ],
      );
      blocTest(
        'return [loading state and error state] when error occured',
        build: () => OnlineArticleBloc(repo),
        setUp: () {
          when(repo.getArticles(any)).thenThrow(Error());
        },
        act: (OnlineArticleBloc bloc) => bloc.add(
          const GetOnlineArticleBlocEvent('trending'),
        ),
        expect: () => [
          OnlineArticleBlocLoadingState(),
          isA<OnlineArticleBlocErrorState>(),
        ],
      );

      blocTest(
        'return [initial state] when event is added',
        build: () => OnlineArticleBloc(repo),
        act: (OnlineArticleBloc bloc) => bloc.add(
          const ResetOnlineArticleBlocEvent(),
        ),
        expect: () => [isA<OnlineArticleBlocInitialState>()],
      );
    },
  );
}
