import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:mumul/messagerie.dart';

import 'home.dart';
import 'qr.dart';
import 'background.dart';
import 'color_range.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

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
        home: Dom(),
      ),
    );
  }
}

class Dom extends StatefulWidget {
  const Dom({Key? key}) : super(key: key);

  @override
  _DomState createState() => _DomState();
}

class _DomState extends State<Dom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Background(),
          PageView(
            controller: PageController(
              initialPage: 1,
            ),
            children: [
              Messagerie(),
              Home(),
              Qr(),
            ],
          ),
        ],
      ),
    );
  }
}
