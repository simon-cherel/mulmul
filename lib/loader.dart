import 'package:flutter/material.dart';
import 'dart:math';
import 'color_range.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationUp;
  late Animation<double> animationDown;
  double offset = 0;
  double offsetMulti = 60;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animationUp = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut)));
    animationDown = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut)));
    controller.addListener(() {
      setState(() {
        if (controller.value <= 0.5) {
          offset = animationUp.value * offsetMulti;
        } else {
          offset = animationDown.value * offsetMulti;
        }
      });
    });
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final parentWidth = MediaQuery.of(context).size.width;
    return SizedBox.expand(
      child: Container(
        color: MaterialColor(0xff149380, color),
        child: Center(
          child: Stack(
            children: [
              Row(
                children: [
                  Spacer(
                    flex: 45,
                  ),
                  Expanded(
                    flex: 54,
                    child: AspectRatio(
                      aspectRatio: 0.27,
                      child: Container(
                        decoration: BoxDecoration(
                          color: MaterialColor(0xffffb6af, color),
                          borderRadius:
                              BorderRadius.circular(log(parentWidth) * 1.7),
                        ),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 25,
                  ),
                  Expanded(
                    flex: 54,
                    child: Transform.translate(
                      offset: Offset(0, -log(parentWidth) * 5.5 - offset),
                      child: AspectRatio(
                        aspectRatio: 0.3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: MaterialColor(0xffffb6af, color),
                            borderRadius:
                                BorderRadius.circular(log(parentWidth) * 1.7),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 25,
                  ),
                  Expanded(
                    flex: 54,
                    child: AspectRatio(
                      aspectRatio: 0.27,
                      child: Container(
                        decoration: BoxDecoration(
                          color: MaterialColor(0xffffb6af, color),
                          borderRadius:
                              BorderRadius.circular(log(parentWidth) * 1.7),
                        ),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 45,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
