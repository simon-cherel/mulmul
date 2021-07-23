import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:adaptive_theme/adaptive_theme.dart';

import 'loader.dart';
import 'dom.dart';
import 'error.dart';
import 'auth.dart';

import 'color_range.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: MaterialColor(0xffffb6af, color),
        accentColor: MaterialColor(0xfffffefc, color),
        backgroundColor: MaterialColor(0xffffefed, color),
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
        home: FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Error();
              }

              if (snapshot.connectionState == ConnectionState.done) {
                return AuthWrapper(home: Dom());
              }

              return Loader();
            }),
      ),
    );
  }
}
