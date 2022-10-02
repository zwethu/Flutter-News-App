import 'package:flutter/cupertino.dart';
import 'package:news_app/core/colors.dart';

const TextStyle logoStyle = TextStyle(
  color: themeColor,
  fontWeight: FontWeight.bold,
  fontSize: 36,
); // text style for News LOGO

const TextStyle topicStyle = TextStyle(
  color: themeColor,
  fontWeight: FontWeight.w600,
  fontSize: 24,
);// text style for tabbar title

const TextStyle titleStyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  color: themeColor,
  fontWeight: FontWeight.w400,
  fontSize: 20,
);// text style for news title

const TextStyle normalStyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  color: themeColor,
  fontWeight: FontWeight.w400,
  fontSize: 16,
);// text style for news description

BoxDecoration newsBoxDecoration = BoxDecoration(
  borderRadius: const BorderRadius.only(
    topRight: Radius.circular(25),
    bottomRight: Radius.circular(25),
  ),
  border: Border.all(
    color: themeColor,
  ),
);
// box decoration for news list's item container
