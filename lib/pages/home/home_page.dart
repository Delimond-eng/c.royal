import 'package:c_royal/models/category.dart';
import 'package:c_royal/settings/style.dart';
import 'package:c_royal/widgets/category_card.dart';
import 'package:c_royal/widgets/popular_card.dart';
import 'package:c_royal/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _size.height,
          width: _size.width,
          decoration: BoxDecoration(
            color: primaryColor,
          ),
          child: Column(
            children: [
              costumHeader(_size),
              costumBody(_size),
            ],
          ),
        ),
      ),
    );
  }

  Widget costumBody(Size _size) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 20.0),
        width: _size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40.0),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
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

  Widget costumHeader(Size _size) {
    return Container(
      height: 70,
      width: _size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Cercle ',
                  style: GoogleFonts.mulish(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 25.0,
                  ),
                ),
                TextSpan(
                  text: 'Royal',
                  style: GoogleFonts.mulish(
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
          Container(
            height: 50.0,
            width: 50.0,
            child: Center(
              child: SvgPicture.asset(
                "assets/svg/notification-svgrepo-com.svg",
                color: Colors.white,
                height: 30.0,
                width: 30.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
