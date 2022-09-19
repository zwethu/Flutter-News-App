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
    return ArticleBox()..articles = fields[1] as Articles;
  }

  @override
  void write(BinaryWriter writer, ArticleBox obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.articles);
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
