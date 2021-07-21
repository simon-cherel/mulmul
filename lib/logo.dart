import 'package:flutter/material.dart';
import 'dart:math';
import 'color_range.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final parentWidth = MediaQuery.of(context).size.width;
    return AspectRatio(
      aspectRatio: 822 / 836,
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
                    offset: Offset(0, -log(parentWidth) * 5.5),
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
    );
  }
}
