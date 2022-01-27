import 'package:c_royal/models/user_home_data.dart';
import 'package:c_royal/settings/style.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class RemiseCard extends StatelessWidget {
  final Offres offer;
  final Widget child;
  const RemiseCard({
    Key key,
    this.child,
    this.offer,
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
                              "${offer.remise} % de remise",
                              style: GoogleFonts.mulish(
                                color: Colors.redAccent,
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
              collapsed: Container(),
              expanded: child,
            ),
          ],
        ),
      ),
    ); /*;*/
  }
}
