import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        AutoRouter.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_back_ios_rounded,
        size: 35,
        color: themeColor,
      ),
    );
  }
}