import 'package:c_royal/components/app_bottom_navigation.dart';
import 'package:c_royal/pages/home/home_page.dart';
import 'package:c_royal/pages/locations/proximity_store_page.dart';
import 'package:c_royal/pages/privileges/privilege_page.dart';
import 'package:c_royal/pages/subscriptions/subscription_page.dart';
import 'package:c_royal/screens/auth/auth_screen.dart';
import 'package:c_royal/services/db/local_storage.dart';
import 'package:c_royal/settings/controllers.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'mon_royaume_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const MonRoyaumePage(),
      const PrivilegePage(),
      const SubscriptionsPage(),
      const ProximityStorePage(),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        if (_selectedIndex == 2) {
          for (var s in homeController.categories) {
            if (s.hasSelected) {
              s.hasSelected = false;
            }
          }
        }
      });
      if (storage.read("user_id") == null && index == 2) {
        Navigator.push(
          context,
          PageTransition(
            child: const AuthenticateScreen(),
            type: PageTransitionType.rightToLeftWithFade,
          ),
        );
        return;
      } else {
        pageController.jumpToPage(_selectedIndex);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: _onItemTapped,
        children: pages,
        scrollDirection: Axis.vertical,
      ),
      bottomNavigationBar: AppBottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
