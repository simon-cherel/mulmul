import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';
import 'color_range.dart';

class Error extends StatefulWidget {
  @override
  _ErrorState createState() => _ErrorState();
}

class _ErrorState extends State<Error> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationRot;
  late Animation<double> animationDown;
  double offset = 0;
  double offsetMulti = 50;
  double rot = 0;
  double rotMulti = 0.16;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animationDown = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.5, curve: Curves.bounceOut)));
    animationRot = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 1.0, curve: Curves.bounceInOut)));
    controller.addListener(() {
      setState(() {
        if (controller.value <= 0.5) {
          offset = animationDown.value * offsetMulti;
        } else {
          rot = animationRot.value * rotMulti;
        }
      });
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final parentWidth = MediaQuery.of(context).size.width;
    return SizedBox.expand(
      child: Container(
        color: MaterialColor(0xff0185A8, color),
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
                    child: Transform.rotate(
                      alignment: Alignment.bottomRight,
                      angle: rot,
                      child: Transform.translate(
                        offset: Offset(0, -log(parentWidth) * 5.5 + offset),
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
