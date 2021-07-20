import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class Panier extends StatefulWidget {
  const Panier({Key? key}) : super(key: key);

  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  SnappingSheetController scrollController = SnappingSheetController();
  IconData iconGrabbing = Icons.shopping_bag_outlined;

  @override
  Widget build(BuildContext context) {
    return SnappingSheet(
      controller: scrollController,
      lockOverflowDrag: true,
      grabbingHeight: 800,
      onSnapCompleted: (sheetPosition, snappingPosition) {
        if ((scrollController.currentPosition < 200)) {
          setState(() {
            iconGrabbing = Icons.shopping_bag_outlined;
          });
        } else {
          setState(() {
            iconGrabbing = Icons.arrow_downward_rounded;
          });
        }
      },
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
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.transparent,
                              child: Image.asset('./assets/persona.png'),
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
                            if (scrollController.currentPosition < 200) {
                              scrollController.snapToPosition(
                                SnappingPosition.factor(positionFactor: 0.47),
                              );
                            } else {
                              scrollController.snapToPosition(
                                SnappingPosition.factor(positionFactor: -0.3),
                              );
                            }
                          },
                          icon: Icon(
                            iconGrabbing,
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
