import 'package:c_royal/settings/style.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class CustomExpandable extends StatelessWidget {
  final Widget child;
  final String title;
  final bool hasExpanded;

  const CustomExpandable({
    Key key,
    this.title,
    this.child,
    this.hasExpanded = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      initialExpanded: hasExpanded,
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
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: primaryColor.withAlpha(100),
                  borderRadius: BorderRadius.zero,
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
                        child: Text(
                          title,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 18.0,
                            letterSpacing: 1.0,
                          ),
                        ),
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
              ),
              collapsed: Container(),
              expanded: child,
            ),
          ],
        ),
      ),
    );
  }
}
