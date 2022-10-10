import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';
import 'dart:math' as math;

// custom loading animation with sand glass
class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animController;
  bool isEmpty = false;
  @override
  void initState() {
    super.initState();
    // initialize animationcontroller
    animController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );
    //begin at zero and end at Pi value to get 180 degree
    animation = Tween<double>(
      begin: 0,
      end: math.pi,
    ).animate(animController)
      ..addStatusListener((status) {
        // reverse the animation when its completed
        if (status == AnimationStatus.completed) {
          animController.reverse();
          isEmpty = !isEmpty;
        }
        // do the animation again when its finished
        else if (status == AnimationStatus.dismissed) {
          animController.forward();
          isEmpty = !isEmpty;
        }
      });
    animController.forward(); // initialize the animation
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: animation.value,
          child: Center(
            // show icon according to gravity logic
            child: isEmpty
                ? const Icon(
                    Icons.hourglass_top_rounded,
                    size: 35,
                    color: themeColor,
                  )
                : const Icon(
                    Icons.hourglass_bottom_rounded,
                    size: 35,
                    color: themeColor,
                  ),
          ),
        );
      },
    );
  }
}
