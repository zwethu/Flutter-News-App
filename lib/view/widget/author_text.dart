import 'package:flutter/material.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/core/styles.dart';

class AuthorText extends StatelessWidget {
  final int index;
  final String author;
  const AuthorText({
    Key? key,
    required this.author,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      height: 25,
      padding: const EdgeInsets.symmetric(horizontal: padding1x),
      child: Text(
        author,
        maxLines: 1,
        style: normalStyle,
      ),
    );
  }
}
