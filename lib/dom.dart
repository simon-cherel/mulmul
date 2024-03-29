import 'package:flutter/material.dart';
import 'package:mulmul/facade.dart';

import 'home.dart';
import 'qr.dart';
import 'background.dart';
import 'messagerie.dart';
import 'commerce.dart';

class Dom extends StatefulWidget {
  const Dom({Key? key}) : super(key: key);

  @override
  _DomState createState() => _DomState();
}

class _DomState extends State<Dom> {
  PageController pageControllerH = PageController(initialPage: 1);
  PageController pageControllerV = PageController(initialPage: 1);
  bool mulmulOn = true;

  void setMulmulOff() {
    setState(() {
      mulmulOn = false;
    });
  }

  void setMulmulOn() {
    setState(() {
      mulmulOn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Background(mulmul: mulmulOn),
          PageView(
            controller: pageControllerH,
            children: [
              Messagerie(pageController: pageControllerH),
              NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification is ScrollNotification) {
                    if (pageControllerV.page == 0) {
                      setMulmulOff();
                    } else {
                      setMulmulOn();
                    }
                  }
                  return false;
                },
                child: PageView(
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  controller: pageControllerV,
                  children: [
                    Facade(
                        pageControllerH: pageControllerH,
                        pageControllerV: pageControllerV,
                        commerce: Commerce(
                            type: "Boucherie",
                            nom: "Boucherie, Les épinettes",
                            localisation: "48.621740, 2.441571",
                            commercant: "Abdel Kechich")),
                    Home(
                        pageControllerH: pageControllerH,
                        pageControllerV: pageControllerV),
                  ],
                ),
              ),
              Qr(pageController: pageControllerH),
            ],
          ),
        ],
      ),
    );
  }
}
