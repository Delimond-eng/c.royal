// ignore_for_file: deprecated_member_use

import 'package:c_royal/settings/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBottomNavigation extends StatefulWidget {
  final int selectedIndex;
  // ignore: prefer_typing_uninitialized_variables
  final Function(int index) onItemTapped;

  const AppBottomNavigation(
      {Key key, @required this.selectedIndex, @required this.onItemTapped})
      : super(key: key);

  @override
  _AppBottomNavigationState createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: light,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.black87,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: GoogleFonts.lato(
          height: 1.5, fontSize: 12.0, fontWeight: FontWeight.w800),
      unselectedLabelStyle: GoogleFonts.lato(height: 1.5, fontSize: 12.0),
      selectedItemColor: accentColor,
      elevation: 0,
      showSelectedLabels: true,
      items: [
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            'assets/svg/home-simple-svgrepo-com.svg',
            fit: BoxFit.scaleDown,
            color: accentColor,
            height: 20.0,
            width: 20.0,
          ),
          icon: SvgPicture.asset(
            'assets/svg/home-simple-svgrepo-com.svg',
            fit: BoxFit.scaleDown,
            color: Colors.black87,
            height: 20.0,
            width: 20.0,
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Accueil"),
              if (widget.selectedIndex == 0) ...[
                const SizedBox(
                  height: 2.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  height: 3.0,
                  width: 10.0,
                )
              ]
            ],
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            'assets/svg/privileged.svg',
            fit: BoxFit.scaleDown,
            color: accentColor,
            height: 20.0,
            width: 20.0,
          ),
          icon: SvgPicture.asset(
            'assets/svg/privileged.svg',
            fit: BoxFit.scaleDown,
            color: Colors.black87,
            height: 20.0,
            width: 20.0,
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Avantages"),
              if (widget.selectedIndex == 1) ...[
                const SizedBox(
                  height: 2.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  height: 3.0,
                  width: 10.0,
                )
              ]
            ],
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            'assets/svg/subscription.svg',
            fit: BoxFit.scaleDown,
            color: accentColor,
            height: 20.0,
            width: 20.0,
          ),
          icon: SvgPicture.asset(
            'assets/svg/subscription.svg',
            fit: BoxFit.scaleDown,
            color: Colors.black87,
            height: 20.0,
            width: 20.0,
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Abonnement"),
              if (widget.selectedIndex == 2) ...[
                const SizedBox(
                  height: 2.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  height: 3.0,
                  width: 10.0,
                )
              ]
            ],
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            'assets/svg/location-position-svgrepo-com.svg',
            fit: BoxFit.scaleDown,
            color: accentColor,
            height: 20.0,
            width: 20.0,
          ),
          icon: SvgPicture.asset(
            'assets/svg/location-position-svgrepo-com.svg',
            fit: BoxFit.scaleDown,
            color: Colors.black87,
            height: 20.0,
            width: 20.0,
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Près de moi"),
              if (widget.selectedIndex == 3) ...[
                const SizedBox(
                  height: 2.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  height: 3.0,
                  width: 10.0,
                )
              ]
            ],
          ),
        )
      ],
      currentIndex: widget.selectedIndex,
      onTap: widget.onItemTapped,
    );
  }
}
