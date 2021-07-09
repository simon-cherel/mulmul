import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class Panier extends StatefulWidget {
  const Panier({Key? key}) : super(key: key);

  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  final scrollController = SnappingSheetController();
  @override
  Widget build(BuildContext context) {
    return SnappingSheet(
      controller: scrollController,
      lockOverflowDrag: true,
      grabbingHeight: 800,
      grabbing: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            color: AdaptiveTheme.of(context).theme.primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    image: AssetImage('./assets/persona.png'),
                                    fit: BoxFit.fill,
                                    alignment: FractionalOffset.center),
                              ),
                              width: 120,
                              height: 120,
                            ),
                          ],
                        ),
                        Spacer(flex: 7),
                        Column(
                          children: [
                            Text(
                              'Rewards',
                              style: TextStyle(
                                  fontSize: 17.0, fontFamily: 'Montserra'),
                            ),
                            Text(
                              '2,45€',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: 'Montserra',
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        Spacer(
                          flex: 4,
                        )
                      ],
                    ),
                    Center(
                      child: IconButton(
                          onPressed: () {
                            scrollController.snapToPosition(
                              SnappingPosition.factor(positionFactor: 0.47),
                            );
                          },
                          icon: Icon(
                            Icons.shopping_bag_outlined,
                            size: 35,
                          )),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(),
              ),
              Expanded(
                flex: 4,
                child: Row(),
              ),
              Expanded(
                flex: 1,
                child: Row(),
              ),
              Expanded(
                flex: 1,
                child: Row(),
              ),
              Expanded(
                flex: 1,
                child: Row(),
              )
            ],
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
