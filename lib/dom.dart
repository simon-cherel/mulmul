import 'package:flutter/material.dart';

import 'home.dart';
import 'qr.dart';
import 'background.dart';
import 'messagerie.dart';

class Dom extends StatefulWidget {
  const Dom({Key? key}) : super(key: key);

  @override
  _DomState createState() => _DomState();
}

class _DomState extends State<Dom> {
  PageController pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Background(),
          PageView(
            controller: pageController,
            children: [
              Messagerie(pageController: pageController),
              Home(pageController: pageController),
              Qr(pageController: pageController),
            ],
          ),
        ],
      ),
    );
  }
}
