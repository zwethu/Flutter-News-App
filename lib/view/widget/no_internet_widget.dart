//show no internet widget
import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.signal_wifi_bad_rounded,
        size: 35,
        color: themeColor,
      ),
    );
  }
}