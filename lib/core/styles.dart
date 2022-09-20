import 'package:flutter/cupertino.dart';
import 'package:news_app/core/colors.dart';

const TextStyle logoStyle = TextStyle(
  color: themeColor,
  fontWeight: FontWeight.bold,
  fontSize: 36,
);

const TextStyle topicStyle = TextStyle(
  color: themeColor,
  fontWeight: FontWeight.w600,
  fontSize: 24,
);

const TextStyle titleStyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  color: themeColor,
  fontWeight: FontWeight.w400,
  fontSize: 20,
);

const TextStyle normalStyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  color: themeColor,
  fontWeight: FontWeight.w400,
  fontSize: 16,
);

BoxDecoration newsBoxDecoration = BoxDecoration(
  borderRadius: const BorderRadius.only(
    topRight: Radius.circular(25),
    bottomRight: Radius.circular(25),
  ),
  border: Border.all(
    color: themeColor,
  ),
);
