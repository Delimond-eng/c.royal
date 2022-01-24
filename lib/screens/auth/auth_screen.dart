import 'dart:ui' as ui;

import 'package:c_royal/screens/home/home_screens.dart';
import 'package:c_royal/settings/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pin_put/pin_put.dart';

class AuthenticateScreen extends StatefulWidget {
  const AuthenticateScreen({Key key}) : super(key: key);

  @override
  State<AuthenticateScreen> createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  final PageController pageController = PageController(initialPage: 0);
  final TextEditingController textPhone = TextEditingController();
  String countryCode = "";
  int currentSteps = 0;

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
      secondStepAuth(context),
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: _size.height * .5,
                width: _size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primaryColor.withOpacity(.8),
                      Colors.blue.withOpacity(.8),
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
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 30.0,
                              ),
                            ),
                            TextSpan(
                              text: 'Royal',
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w600,
                                color: accentColor,
                                letterSpacing: 1.0,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),*/

                      if (currentSteps == 0) ...[
                        Lottie.asset(
                          "assets/lottiesfiles/4430-phone-number-verification.json",
                          height: 150.0,
                          width: 150.0,
                        ),
                      ] else ...[
                        Lottie.asset(
                          "assets/lottiesfiles/81148-new-message-notification.json",
                          height: 150.0,
                          width: 150.0,
                        ),
                      ],
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Text(
                          currentSteps == 0
                              ? "Entrez votre numéro de téléphone pour activer votre compte !"
                              : "Veuillez entrer le code de validation envoyée par sms à votre numéro de téléphone !",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /*Stack(
              alignment: AlignmentDirectional.topEnd,
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
            ),*/
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: onPageChanged,
                children: steps,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
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
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: primaryColor.withAlpha(100),
                  ),
                  color: Colors.white,
                ),
                child: IntlPhoneField(
                  controller: textPhone,
                  keyboardType: TextInputType.phone,
                  showCountryFlag: true,
                  decoration: InputDecoration(
                    hintMaxLines: 9,
                    contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
                    hintText: "Entrez votre numéro de tél.",
                    hintStyle: GoogleFonts.lato(
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
                height: 20.0,
              ),
              Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      blurRadius: 12.0,
                      offset: const Offset(0, 10.0),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      primaryColor,
                    ],
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      /*Navigator.push(
                        context,
                        PageTransition(
                          child: const HomeScreen(),
                          type: PageTransitionType.rightToLeftWithFade,
                        ),
                      );*/
                      setState(() {
                        currentSteps++;
                      });
                      pageController.animateToPage(
                        currentSteps,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
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

  Widget secondStepAuth(BuildContext context) {
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PinPut(
                  fieldsCount: 5,

                  //onSubmit: (String pin) => _showSnackBar(pin, context),
                  //focusNode: _pinPutFocusNode,
                  //controller: _pinPutController,
                  selectedFieldDecoration: BoxDecoration(
                    border: Border.all(color: Colors.green[700]),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  eachFieldWidth: 55.0,
                  eachFieldHeight: 70.0,
                  onSubmit: (String pin) {
                    if (pin.isNotEmpty) {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const HomeScreen(),
                          type: PageTransitionType.rightToLeftWithFade,
                        ),
                      );
                    }
                  },
                  submittedFieldDecoration: BoxDecoration(
                    border: Border.all(color: Colors.green[700]),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  followingFieldDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 65.0,
              ),
              /*Container(
                margin: const EdgeInsets.all(8.0),
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      blurRadius: 12.0,
                      offset: const Offset(0, 10.0),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.green[700],
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
              ),*/

              TextButton(
                onPressed: () {},
                child: Text(
                  "Réenvoyer le code",
                  style: GoogleFonts.lato(
                    color: Colors.black87,
                  ),
                ),
              )
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
      height: 10.0,
      width: 10.0,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isActive
              ? [
                  primaryColor,
                  Colors.blue,
                ]
              : [
                  Colors.grey[500],
                  Colors.grey[500],
                ],
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      duration: const Duration(milliseconds: 500),
    );
  }
}
