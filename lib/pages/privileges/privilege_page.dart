import 'package:c_royal/models/category.dart';
import 'package:c_royal/settings/style.dart';
import 'package:c_royal/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivilegePage extends StatefulWidget {
  const PrivilegePage({Key key}) : super(key: key);

  @override
  _PrivilegePageState createState() => _PrivilegePageState();
}

class _PrivilegePageState extends State<PrivilegePage> {
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
        width: _size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40.0),
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(15.0),
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
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      for (int i = 0; i < 10; i++) ...[
                        const PrivilegeCard(),
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

class PrivilegeCard extends StatelessWidget {
  const PrivilegeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: const EdgeInsets.only(bottom: 8.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200],
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 5.0,
        ),
        child: Row(
          children: [
            Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/olive_resto.png"),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.1),
                    blurRadius: 10.0,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fleuve congo hôtel",
                      style: GoogleFonts.lato(
                        color: Colors.black87,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      "Restaurant & lounges barres",
                      style: GoogleFonts.lato(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "15% de remise sur l'addition",
                      style: GoogleFonts.lato(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
