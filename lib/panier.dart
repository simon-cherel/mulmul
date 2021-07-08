import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class panier extends StatefulWidget {
  const panier({Key? key}) : super(key: key);

  @override
  _panierState createState() => _panierState();
}

class _panierState extends State<panier> {
  @override
  Widget build(BuildContext context) {
    return SnappingSheet(
      //lockOverflowDrag: true,
      grabbingHeight: 800,
      grabbing: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            color: AdaptiveTheme.of(context).theme.primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          ),
        ),
      ),
      snappingPositions: [
        SnappingPosition.factor(
            positionFactor: -0.3,
            snappingCurve: Curves.ease,
            snappingDuration: Duration(milliseconds: 500)),
        SnappingPosition.factor(
            positionFactor: 0.47,
            snappingCurve: Curves.ease,
            snappingDuration: Duration(milliseconds: 500)),
      ],
      sheetBelow: SnappingSheetContent(
        child: Container(
          color: AdaptiveTheme.of(context).theme.primaryColor,
          child: SingleChildScrollView(),
        ),
      ),
    );
  }
}
