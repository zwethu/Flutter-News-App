import 'package:hive/hive.dart';
import 'package:news_app/model/entities/article.dart';
part 'article_box.g.dart';

@HiveType(typeId: 1)
class ArticleBox extends HiveObject {
  @HiveField(1)
  late Articles articles;
}
