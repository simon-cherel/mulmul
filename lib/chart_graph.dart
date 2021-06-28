import 'package:flutter/material.dart';

Color mainD = Color(0xffb6af);
Color secondD = Color(0xfae0c7);
Color windowD = Color(0xfff5eb);
Color mainW = Color(0xffb6af);
Color secondW = Color(0xfae0c7);
Color windowW = Color(0x141e2a);

Theme darkTheme = Theme('dark_theme', mainD, secondD, windowD);
Theme whiteTheme = Theme('white_theme', mainW, secondW, windowW);

class Theme {
  String name;
  Color main;
  Color second;
  Color window;
  Theme(this.name, this.main, this.second, this.window) {
    // this.name = name;
    // this.main = main;
    // this.second = second;
    // this.window = window;
  }
}
