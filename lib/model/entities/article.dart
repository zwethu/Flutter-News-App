// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'article.g.dart';

@JsonSerializable(explicitToJson: true)
class Article extends Equatable {
  String? status;
  int? totalResults;
  List<Articles?> articles;
  Article(
    this.status,
    this.totalResults,
    this.articles,
  );

  @override
  List<Object?> get props => [status, totalResults, articles];

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Articles extends Equatable {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
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

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
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
