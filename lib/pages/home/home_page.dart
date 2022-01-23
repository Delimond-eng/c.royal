import 'package:c_royal/components/app_header.dart';
import 'package:c_royal/components/notification_drawer.dart';
import 'package:c_royal/models/category.dart';
import 'package:c_royal/settings/style.dart';
import 'package:c_royal/widgets/category_card.dart';
import 'package:c_royal/widgets/popular_card.dart';
import 'package:c_royal/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Container(
          height: _size.height,
          width: _size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.5),
            ),
            child: Column(
              children: [
                AppHeader(
                  isHome: true,
                  onOpenNotificateDrawer: () {
                    scaffoldKey.currentState.openEndDrawer();
                  },
                ),
                costumBody(_size),
              ],
            ),
          ),
        ),
      ),
      endDrawer: const NotificationDrawer(),
    );
  }

  Widget costumBody(Size _size) {
    return Expanded(
      child: Container(
        width: _size.width,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  bottom: 10.0,
                ),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: categories.map((e) {
                    return CategoryCard(
                      data: e,
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Nous ont rejoint cette semaine",
                  style: GoogleFonts.lato(
                    color: Colors.black87,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  bottom: 18.0,
                ),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    for (int i = 0; i < 4; i++) ...[
                      const PostNewCard(),
                    ]
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Les plus populaires",
                  style: GoogleFonts.lato(
                    color: Colors.black87,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  bottom: 18.0,
                ),
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    for (int i = 0; i < 4; i++) ...[
                      const PopularCard(),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
