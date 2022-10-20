// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleBoxAdapter extends TypeAdapter<ArticleBox> {
  @override
  final int typeId = 1;

  @override
  ArticleBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleBox()
      ..author = fields[1] as String
      ..title = fields[2] as String
      ..description = fields[3] as String
      ..url = fields[4] as String
      ..urlToImage = fields[5] as String
      ..publishedAt = fields[6] as String
      ..content = fields[7] as String;
  }

  @override
  void write(BinaryWriter writer, ArticleBox obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.urlToImage)
      ..writeByte(6)
      ..write(obj.publishedAt)
      ..writeByte(7)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
