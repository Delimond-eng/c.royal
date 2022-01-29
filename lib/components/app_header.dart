import 'package:badges/badges.dart';
import 'package:c_royal/screens/auth/auth_screen.dart';
import 'package:c_royal/settings/style.dart';
import 'package:c_royal/settings/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:popover/popover.dart';

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
            Row(
              children: [
                Badge(
                  position: BadgePosition.topStart(),
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
                          blurRadius: 20,
                          offset: Offset.zero,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                    height: 37.0,
                    width: 37.0,
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
                ),
                const SizedBox(
                  width: 10.0,
                ),
                if (storage.read("user_id") == null) ...[
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black87,
                          Colors.grey[700],
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          offset: Offset.zero,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                    height: 37.0,
                    width: 37.0,
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30.0),
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: const AuthenticateScreen(),
                              type: PageTransitionType.rightToLeftWithFade,
                            ),
                          );
                        },
                        child: const Center(
                          child: Icon(
                            CupertinoIcons.person,
                            color: Colors.white,
                            size: 16.0,
                          ),
                        ),
                      ),
                    ),
                  )
                ] else ...[
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.green,
                          Colors.blue,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          offset: Offset.zero,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                    height: 37.0,
                    width: 37.0,
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30.0),
                        onTap: () {
                          showPopover(
                            barrierColor: Colors.black12,
                            context: context,
                            arrowDxOffset: 135,
                            arrowDyOffset: 0,
                            radius: 20,
                            isParentAlive: () => true,
                            backgroundColor: Colors.black87,
                            transitionDuration:
                                const Duration(milliseconds: 150),
                            bodyBuilder: (context) => const ListItems(),
                            onPop: () => print('Popover was popped!'),
                            direction: PopoverDirection.top,
                            width: 330.0,
                            height: 160.0,
                            arrowHeight: 15,
                            arrowWidth: 20,
                          );
                        },
                        child: const Center(
                          child: Icon(
                            CupertinoIcons.person_fill,
                            color: Colors.white,
                            size: 16.0,
                          ),
                        ),
                      ),
                    ),
                  )
                ]
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: GridView(
        padding: const EdgeInsets.all(5),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.5,
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: [
          ContextMenuBtn(
            icon: CupertinoIcons.person_fill,
            title: "Mon compte",
            onPressed: () {},
          ),
          ContextMenuBtn(
            icon: CupertinoIcons.collections_solid,
            title: "Mon abonnement",
            onPressed: () {},
          ),
          ContextMenuBtn(
            icon: CupertinoIcons.bell_circle_fill,
            title: "Nouveautés",
            onPressed: () {},
          ),
          ContextMenuBtn(
            icon: CupertinoIcons.heart_circle_fill,
            title: "Mes préfèrences",
            onPressed: () {},
          ),
          ContextMenuBtn(
            icon: CupertinoIcons.question_circle_fill,
            title: "Aide",
            onPressed: () {},
          ),
          ContextMenuBtn(
            icon: Icons.logout,
            title: "Deconnexion",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class ContextMenuBtn extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onPressed;
  const ContextMenuBtn({
    Key key,
    this.icon,
    this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: secondaryColor,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  title,
                  style: GoogleFonts.lato(
                    color: Colors.grey[100],
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
