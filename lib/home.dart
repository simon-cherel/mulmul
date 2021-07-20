import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import 'panier.dart';
import 'gestures.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool darkmode = false;
  dynamic savedThemeMode;
  IconData iconTheme = Icons.refresh_rounded;

  void initState() {
    super.initState();
    getCurrentTheme();
  }

  Future getCurrentTheme() async {
    savedThemeMode = await AdaptiveTheme.getThemeMode();
    if (savedThemeMode.toString() == 'AdaptiveThemeMode.dark') {
      setState(() {
        darkmode = true;
        iconTheme = Icons.nightlight_rounded;
        // mapStyle = getJsonFile("assets/map_style_dark.json").toString();
      });
    } else {
      setState(() {
        darkmode = false;
        iconTheme = Icons.wb_sunny_rounded;
      });
    }
  }

  void changeCurrentTheme() {
    if (darkmode) {
      AdaptiveTheme.of(context).setLight();
      getCurrentTheme();
    } else {
      AdaptiveTheme.of(context).setDark();
      getCurrentTheme();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
          child: SizedBox.expand(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: changeCurrentTheme,
                        icon: Icon(
                          iconTheme,
                          size: 30,
                          color: AdaptiveTheme.of(context).theme.primaryColor,
                        )),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Evry, France',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontFamily: 'Montserra'),
                    ),
                  ),
                ),
                Expanded(
                    flex: 17,
                    child: GestureBar(pageController: widget.pageController)),
              ],
            ),
          ),
        ),
        Panier(),
      ],
    );
  }
}
