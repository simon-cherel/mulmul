import 'package:flutter/material.dart';
import 'dart:ui';

Widget buildBlur({
  required Widget child,
  BorderRadius borderRadius = BorderRadius.zero,
  double sigmaX = 40,
  double sigmaY = 40,
}) =>
    ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: child,
      ),
    );
