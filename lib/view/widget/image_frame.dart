import 'package:flutter/material.dart';
import 'package:news_app/view/widget/news_list.dart';

class ImageFrame extends StatelessWidget {
  final String urlToImage;
  final int index;
  const ImageFrame({
    Key? key,
    required this.urlToImage,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      urlToImage,
      width: 150,
      height: 150,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const ImageLoadingWidget();
      },
      errorBuilder: (context, error, stackTrace) {
        return const ImageErrorWidget();
      },
    );
  }
}