import 'package:flutter/cupertino.dart';
import 'package:news_app/core/styles.dart';

class EmptyWidget extends StatelessWidget {
  final String text;
  const EmptyWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: topicStyle,
      ),
    );
  }
}
