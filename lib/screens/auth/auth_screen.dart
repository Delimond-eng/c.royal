import 'dart:ui' as ui;

import 'package:c_royal/screens/home/home_screens.dart';
import 'package:c_royal/settings/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:page_transition/page_transition.dart';

class AuthenticateScreen extends StatefulWidget {
  const AuthenticateScreen({Key key}) : super(key: key);

  @override
  State<AuthenticateScreen> createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  final PageController pageController = PageController(initialPage: 0);
  final TextEditingController textPhone = TextEditingController();
  String countryCode = "";
  int currentSteps = 1;

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  onPageChanged(int index) {
    setState(() {
      currentSteps = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    List<Widget> steps = [
      firstStepAuth(context),
      const Center(
        child: Text("Second step"),
      ),
    ];
    return Scaffold(
      body: Container(
        height: _size.height,
        width: _size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: _size.height * .5,
                width: _size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(.8),
                      primaryColor.withOpacity(.8),
                    ],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Cercle ',
                              style: GoogleFonts.lato(
                                color: primaryColor,
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                                fontSize: 50.0,
                                shadows: [
                                  Shadow(
                                    color: Colors.white.withOpacity(.8),
                                    blurRadius: 4.0,
                                    offset: const Offset(0, 5),
                                  )
                                ],
                              ),
                            ),
                            TextSpan(
                              text: 'Royal',
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w600,
                                color: accentColor,
                                letterSpacing: 1.0,
                                fontStyle: FontStyle.italic,
                                fontSize: 30.0,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(.2),
                                    blurRadius: 4.0,
                                    offset: const Offset(0, 5),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 5,
                            width: 110,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(20.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10.0,
                                  color: Colors.black.withOpacity(.2),
                                  offset: const Offset(0, 8.0),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 5,
                            width: 110,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(20.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10.0,
                                  color: Colors.black.withOpacity(.2),
                                  offset: const Offset(0, 8.0),
                                )
                              ],
                            ),
                          ),
                        ],
                      )*/

                      Text(
                        'Entrez votre numéro de téléphone pour activer votre compte !',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mulish(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: onPageChanged,
                children: steps,
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < steps.length; i++) ...[
                        if (i == currentSteps) ...[
                          Dot(true)
                        ] else ...[
                          Dot(false)
                        ]
                      ]
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget firstStepAuth(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.5),
      ),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: primaryColor,
                  ),
                  color: Colors.white,
                ),
                child: IntlPhoneField(
                  controller: textPhone,
                  keyboardType: TextInputType.phone,
                  showCountryFlag: false,
                  decoration: const InputDecoration(
                    hintMaxLines: 9,
                    contentPadding: EdgeInsets.only(top: 10, bottom: 10),
                    hintText: "Entrez votre numéro de tél.",
                    hintStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0,
                    ),
                    border: InputBorder.none,
                    counterText: '',
                  ),
                  initialCountryCode: 'CD',
                  countryCodeTextColor: Colors.grey[600],
                  onChanged: (phone) {
                    setState(() {
                      countryCode = phone.countryCode;
                    });
                  },
                  onCountryChanged: (phone) {
                    setState(() {
                      countryCode = phone.countryCode;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 12.0,
                      offset: const Offset(0, 3),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [
                      primaryColor,
                      secondaryColor,
                    ],
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const HomeScreen(),
                          type: PageTransitionType.rightToLeftWithFade,
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(30.0),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset(
                          "assets/svg/next-right-arrow-svgrepo-com.svg",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Dot extends StatelessWidget {
  bool isActive;
  Dot(this.isActive);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 12.0,
      width: 12.0,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      duration: const Duration(milliseconds: 150),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: isActive ? primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
