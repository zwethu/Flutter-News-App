// Mocks generated by Mockito 5.3.0 from annotations
// in news_app/test/view_model_test/bloc_test/online_article_bloc_test.dart/online_article_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:news_app/model/entities/article.dart' as _i5;
import 'package:news_app/model/repository/online_article_repo.dart' as _i3;
import 'package:news_app/model/service/news_api_service.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeNewsApiService_0 extends _i1.SmartFake
    implements _i2.NewsApiService {
  _FakeNewsApiService_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [OnlineArticleRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockOnlineArticleRepo extends _i1.Mock implements _i3.OnlineArticleRepo {
  MockOnlineArticleRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.NewsApiService get service => (super.noSuchMethod(
          Invocation.getter(#service),
          returnValue: _FakeNewsApiService_0(this, Invocation.getter(#service)))
      as _i2.NewsApiService);
  @override
  _i4.Future<List<_i5.Articles?>> getArticles(String? topic) =>
      (super.noSuchMethod(Invocation.method(#getArticles, [topic]),
              returnValue:
                  _i4.Future<List<_i5.Articles?>>.value(<_i5.Articles?>[]))
          as _i4.Future<List<_i5.Articles?>>);
}
