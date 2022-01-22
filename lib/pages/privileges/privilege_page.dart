import 'package:c_royal/components/app_header.dart';
import 'package:c_royal/models/category.dart';
import 'package:c_royal/settings/style.dart';
import 'package:c_royal/widgets/category_card.dart';
import 'package:c_royal/widgets/privilege_card.dart';
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
                const AppHeader(
                  title: "Privilèges",
                ),
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
                child: Scrollbar(
                  thickness: 3.0,
                  radius: const Radius.circular(5.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        for (int i = 0; i < 10; i++) ...[
                          const PrivilegeCard(),
                        ]
                      ],
                    ),
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
