import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CatIcon extends StatelessWidget {
  final String iconKey;
  const CatIcon({Key key, this.iconKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String icon = "";
    if (iconKey.toLowerCase().contains("restau")) {
      icon = "assets/svg/restaurant-svgrepo-com.svg";
    } else if (iconKey.toLowerCase().contains("supermarch")) {
      icon = "assets/svg/shopping.svg";
    } else if (iconKey.toLowerCase().contains("hotel")) {
      icon = "assets/svg/hotel-svgrepo-com.svg";
    } else if (iconKey.toLowerCase().contains("station")) {
      icon = "assets/svg/gas-station-svgrepo-com.svg";
    } else {
      icon = "assets/svg/other.svg";
    }
    return SvgPicture.asset(
      icon,
      color: Colors.white,
      height: 25.0,
      width: 25.0,
    );
  }
}
