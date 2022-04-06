import 'package:c_royal/settings/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  List<String> operatorsIcons = [
    "assets/icons/mastercard.png",
    "assets/icons/visa.png",
    "assets/icons/mpsa.png",
    "assets/icons/airtelmoney.png",
    "assets/icons/afrimoney.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _main(context),
            _body(context),
          ],
        ),
      ),
    );
  }

  Widget _main(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/shapes/shape_4.png"),
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
        gradient: LinearGradient(
          colors: [primaryColor, golden900],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10.0),
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            "assets/svg/back-svgrepo-com.svg",
                            color: light,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Paiement abonnement",
                    style: GoogleFonts.dancingScript(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          golden800,
                          golden900,
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        CupertinoIcons.person,
                        color: Colors.white,
                        size: 15.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: operatorsIcons.map((e) {
                  return Container(
                    height: 80.0,
                    width: 120.0,
                    margin: const EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          blurRadius: 10.0,
                          offset: const Offset(0, 8),
                        )
                      ],
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10.0),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            e,
                            alignment: Alignment.center,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.fromLTRB(10.0, 180.0, 10.0, 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Veuillez sélectionner un mode de paiement !",
                  style: GoogleFonts.dancingScript(
                    color: Colors.pink,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Lottie.asset(
                        "assets/lottiesfiles/98100-payment-cards.json"),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          top: 166,
          child: Icon(Icons.arrow_drop_up, color: Colors.white),
        )
      ],
    );
  }
}

class Operator {
  String logoLink;
  bool isActived = false;

  Operator({this.logoLink});
}
