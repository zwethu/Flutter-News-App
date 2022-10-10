import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputProvider extends ChangeNotifier {
  TextEditingController controller = TextEditingController();
  
  InputProvider() {
    controller.addListener(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String get getText => controller.text;
  void setText(String input) {
    controller.text = input;
    notifyListeners();
  }
}
