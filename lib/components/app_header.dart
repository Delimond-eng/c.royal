import 'package:c_royal/settings/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final bool isHome;
  const AppHeader({
    Key key,
    this.title,
    this.isHome = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
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
                SvgPicture.asset(
                  "assets/svg/circle-svgrepo-com.svg",
                  height: 20.0,
                  width: 20.0,
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
                            fontWeight: FontWeight.w500,
                            color: accentColor,
                            letterSpacing: 1.0,
                            fontStyle: FontStyle.italic,
                            fontSize: 16.0,
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
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryColor,
                    Colors.blue,
                  ],
                ),
                borderRadius: BorderRadius.circular(10.0),
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
              child: Center(
                child: SvgPicture.asset(
                  "assets/svg/notification-svgrepo-com.svg",
                  color: Colors.white,
                  height: 25.0,
                  width: 25.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
