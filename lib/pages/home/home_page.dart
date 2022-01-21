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
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/bg2.jpg"),
            fit: BoxFit.cover,
          )),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.5),
            ),
            child: Column(
              children: [
                costumHeader(_size),
                costumBody(_size),
              ],
            ),
          ),
        ),
      ),
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

  Widget costumHeader(Size _size) {
    return Container(
      height: 60.0,
      width: _size.width,
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
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Cercle ',
                        style: GoogleFonts.lato(
                          color: Colors.black87,
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
