import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class panier extends StatefulWidget {
  const panier({Key? key}) : super(key: key);

  @override
  _panierState createState() => _panierState();
}

class _panierState extends State<panier> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      maxChildSize: 0.9,
      minChildSize: 0.1,
      builder: (context, controller) => Container(
        decoration: BoxDecoration(
          color: AdaptiveTheme.of(context).theme.primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        ),
        child: SingleChildScrollView(
          controller: controller,
          child: Container(),
        ),
      ),
    );
  }
}
