import 'package:c_royal/settings/style.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class RemiseCard extends StatelessWidget {
  final Widget child;
  const RemiseCard({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        child: Column(
          children: <Widget>[
            ExpandablePanel(
              theme: const ExpandableThemeData(
                fadeCurve: Curves.bounceIn,
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToExpand: true,
                tapBodyToCollapse: false,
                hasIcon: false,
              ),
              header: Container(
                height: 80.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: primaryColor.withAlpha(50),
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "15 % de remise sur l'addition",
                              style: GoogleFonts.mulish(
                                color: primaryColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Tous les jours de 10H à 18H",
                              style: GoogleFonts.mulish(
                                color: Colors.black87,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.all(7.0),
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              primaryColor,
                              Colors.blue,
                            ],
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 12.0,
                              offset: const Offset(0, 10.0),
                            )
                          ],
                        ),
                        child: Center(
                          child: ExpandableIcon(
                            theme: const ExpandableThemeData(
                              expandIcon: CupertinoIcons.chevron_down,
                              collapseIcon: CupertinoIcons.chevron_up,
                              iconColor: Colors.white,
                              iconSize: 15.0,
                              iconRotationAngle: math.pi / 2,
                              hasIcon: false,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              /*Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: primaryColor.withAlpha(100),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.3),
                      blurRadius: 12.0,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container()
                      ),
                    ),
                    ExpandableIcon(
                      theme: const ExpandableThemeData(
                        expandIcon: CupertinoIcons.add,
                        collapseIcon: CupertinoIcons.minus,
                        iconColor: Colors.white,
                        iconSize: 15.0,
                        iconRotationAngle: math.pi / 2,
                        iconPadding: EdgeInsets.only(right: 15),
                        hasIcon: false,
                      ),
                    ),
                  ],
                ),
              )*/
              collapsed: Container(),
              expanded: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: child,
              ),
            ),
          ],
        ),
      ),
    ); /*;*/
  }
}
