import 'package:flutter/widgets.dart';

class NavigationBarProvider extends ChangeNotifier {
  int currentIndex = 0;
  int get getIndex => currentIndex;
  void setIndex(int input) {
   currentIndex = input;
    notifyListeners();
  }
}
