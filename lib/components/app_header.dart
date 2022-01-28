import 'package:badges/badges.dart';
import 'package:c_royal/settings/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final bool isHome;
  final Function onOpenNotificateDrawer;
  const AppHeader({
    Key key,
    this.title,
    this.isHome = false,
    this.onOpenNotificateDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(
        bottom: 15.0,
        right: 10.0,
        left: 10.0,
        top: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            blurRadius: 10.0,
            offset: const Offset(0, 10.0),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    SvgPicture.asset("assets/svg/circle-svgrepo-com.svg",
                        height: 30.0, width: 30.0, color: primaryColor),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          "assets/svg/royal.svg",
                          height: 15.0,
                          width: 15.0,
                          color: secondaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 8.0,
                ),
                if (isHome) ...[
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Cercle ',
                          style: GoogleFonts.lato(
                            color: primaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 25.0,
                          ),
                        ),
                        TextSpan(
                          text: 'Royal',
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            color: accentColor,
                            letterSpacing: 1.0,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  Text(
                    title,
                    style: GoogleFonts.lato(
                      color: primaryColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 18.0,
                    ),
                  )
                ]
              ],
            ),
            Badge(
              position: BadgePosition.topStart(start: 1),
              elevation: 0,
              badgeContent: Text(
                "0",
                style: GoogleFonts.lato(
                  color: Colors.white,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primaryColor,
                      secondaryColor,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(.1),
                      offset: const Offset(0, 10.0),
                    )
                  ],
                ),
                height: 40.0,
                width: 40.0,
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30.0),
                    onTap: onOpenNotificateDrawer,
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svg/notification-svgrepo-com.svg",
                        color: Colors.white,
                        height: 20.0,
                        width: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
