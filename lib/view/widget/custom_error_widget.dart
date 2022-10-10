import 'package:flutter/material.dart';

import '../../core/colors.dart';
//error widget with error icon

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.error_outline,
        size: 35,
        color: themeColor,
      ),
    );
  }
}
