import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'map_viewer.dart';

class Background extends StatefulWidget {
  const Background({Key? key}) : super(key: key);

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  String mapStyle = '';

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
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
        Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'mulmul',
                  style: TextStyle(
                      fontSize: 42.0,
                      color: Colors.white,
                      fontFamily: 'Comfortaa'),
                ),
              ),
            ),
            Spacer(
              flex: 16,
            ),
          ],
        ),
      ],
    );
  }
}
