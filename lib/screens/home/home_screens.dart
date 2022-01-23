import 'package:c_royal/components/app_bottom_navigation.dart';
import 'package:c_royal/pages/home/home_page.dart';
import 'package:c_royal/pages/privileges/privilege_page.dart';
import 'package:flutter/material.dart';

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
      const HomePage(),
      const PrivilegePage(),
      const Center(
        child: Text("Scanner le code"),
      ),
      const Center(
        child: Text("Près de moi"),
      )
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
      pageController.jumpToPage(_selectedIndex);
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
