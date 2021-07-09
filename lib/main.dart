import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import 'map_viewer.dart';
import 'color_range.dart';
import 'panier.dart';
import 'gestures.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: MaterialColor(0xffffb6af, color),
        accentColor: MaterialColor(0xfffffefc, color),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: MaterialColor(0xff95767c, color),
        accentColor: MaterialColor(0xff19212f, color),
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'mulmul',
        theme: theme,
        darkTheme: darkTheme,
        home: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool darkmode = false;
  String mapStyle = '';
  dynamic savedThemeMode;
  IconData iconTheme = Icons.refresh_rounded;

  void initState() {
    super.initState();
    getCurrentTheme();
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

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  Future getCurrentTheme() async {
    savedThemeMode = await AdaptiveTheme.getThemeMode();
    if (savedThemeMode.toString() == 'AdaptiveThemeMode.dark') {
      setState(() {
        darkmode = true;
        iconTheme = Icons.nightlight_rounded;
        // mapStyle = getJsonFile("assets/map_style_dark.json").toString();
        mapStyle = '''[
    {
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#242f3e"
        }
      ]
    },
    {
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#746855"
        }
      ]
    },
    {
      "elementType": "labels.text.stroke",
      "stylers": [
        {
          "color": "#242f3e"
        }
      ]
    },
    {
      "featureType": "administrative.locality",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#d59563"
        }
      ]
    },
    {
      "featureType": "poi",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#d59563"
        }
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#263c3f"
        }
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#6b9a76"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#38414e"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry.stroke",
      "stylers": [
        {
          "color": "#212a37"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#9ca5b3"
        }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#746855"
        }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry.stroke",
      "stylers": [
        {
          "color": "#1f2835"
        }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#f3d19c"
        }
      ]
    },
    {
      "featureType": "transit",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#2f3948"
        }
      ]
    },
    {
      "featureType": "transit.station",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#d59563"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#17263c"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#515c6d"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "labels.text.stroke",
      "stylers": [
        {
          "color": "#17263c"
        }
      ]
    }
  ]''';
      });
    } else {
      setState(() {
        darkmode = false;
        iconTheme = Icons.wb_sunny_rounded;
        mapStyle = '[{}]';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          MapViewer(
            mapStyle: mapStyle,
          ),
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(),
              )
            ],
          ),
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
                  Expanded(flex: 19, child: GestureBar()),
                ],
              ),
            ),
          ),
          Panier(),
        ],
      ),
    );
  }
}
