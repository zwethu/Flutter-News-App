import 'package:flutter/material.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/core/styles.dart';

class TitleText extends StatelessWidget {
  final int index;
  final String title;
  const TitleText({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      padding: const EdgeInsets.all(padding1x),
      child: Text(
        title,
        maxLines: 4,
        style: titleStyle,
      ),
    );
  }
}