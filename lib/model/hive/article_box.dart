import 'package:hive/hive.dart';
part 'article_box.g.dart';

@HiveType(typeId: 1)
class ArticleBox extends HiveObject {
  @HiveField(1)
  String? author;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? url;
  @HiveField(5)
  String? urlToImage;
  @HiveField(6)
  String? publishedAt;
  @HiveField(7)
  String? content;
}
