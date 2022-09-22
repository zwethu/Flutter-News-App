import 'package:flutter/cupertino.dart';

class ImageLoadingAnimationProvider extends ChangeNotifier {
  late Animation<double> animation;
  late AnimationController animController;
  bool isEmpty = false;
}
