import 'package:c_royal/settings/style.dart';
import 'package:c_royal/widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationDrawer extends StatelessWidget {
  const NotificationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                15.0,
                25.0,
                25.0,
                20.0,
              ),
              child: Row(
                children: [
                  Container(
                    height: 40.0,
                    width: 60.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20.0),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/svg/back-svgrepo-com.svg",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  SvgPicture.asset(
                    "assets/svg/bell-notification-svgrepo-com.svg",
                    color: Colors.white,
                    height: 25.0,
                    width: 25.0,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    "Nouvelles notifications",
                    style: GoogleFonts.lato(
                      color: secondaryColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      for (int i = 0; i < 10; i++) ...[
                        const NotificationCard(),
                      ]
                    ],
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
