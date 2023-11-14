// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'article_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ArticleResponse extends Equatable {
  String? status;
  int? totalResults;
  List<Article?> articles;
  ArticleResponse(
    this.status,
    this.totalResults,
    this.articles,
  );

  @override
  List<Object?> get props => [status, totalResults, articles];

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Article extends Equatable {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article(
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  );

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content
      ];

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Source extends Equatable {
  String? id;
  String? name;
  Source(this.id, this.name);

  @override
  List<Object?> get props => [id, name];

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
