// ignore: unused_import
import 'dart:async';
import 'dart:developer';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_maps_flutter/google_maps_flutter.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

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
        primarySwatch: MaterialColor(0xff8e7076, color),
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

  Future getCurrentTheme() async {
    savedThemeMode = await AdaptiveTheme.getThemeMode();
    if (savedThemeMode.toString() == 'AdaptiveThemeMode.dark') {
      setState(() {
        darkmode = true;
        iconTheme = Icons.nightlight_rounded;
      });
    } else {
      setState(() {
        darkmode = false;
        iconTheme = Icons.wb_sunny_rounded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          MapViewer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
            child: SizedBox.expand(
              child: Wrap(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: changeCurrentTheme,
                        icon: Icon(
                          iconTheme,
                          color: AdaptiveTheme.of(context).theme.primaryColor,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MapViewer extends StatefulWidget {
  const MapViewer({Key? key}) : super(key: key);

  @override
  _MapViewerState createState() => _MapViewerState();
}

class _MapViewerState extends State<MapViewer> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      buildingsEnabled: false,
      compassEnabled: false,
      rotateGesturesEnabled: false,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: true,
      zoomGesturesEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
