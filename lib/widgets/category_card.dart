import 'dart:math';

import 'package:c_royal/models/category.dart';
import 'package:c_royal/settings/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  final Category data;
  const CategoryCard({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      height: 100.0,
      width: 80.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            offset: const Offset(0, 3),
            blurRadius: 12.0,
          )
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey[200],
                    ),
                  ),
                  child: SvgPicture.asset(
                    data.icon,
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)]
                        .shade900,
                    height: 25.0,
                    width: 25.0,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Flexible(
                  child: Text(
                    data.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      color: primaryColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 12.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
