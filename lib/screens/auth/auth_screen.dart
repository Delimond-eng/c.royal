import 'package:c_royal/screens/home/home_screens.dart';
import 'package:c_royal/services/api/api_manager.dart';
import 'package:c_royal/settings/style.dart';
import 'package:c_royal/settings/utilities.dart';
import 'package:c_royal/widgets/custom_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final TextEditingController textCode = TextEditingController();

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
          color: Colors.white,
        ),
        child: Stack(
          children: [
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                height: _size.height * .5,
                width: _size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primaryColor,
                      primaryColor,
                      secondaryColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (currentSteps == 0) ...[
                        Stack(
                          overflow: Overflow.visible,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/circle-svgrepo-com.svg",
                              height: 80.0,
                              width: 80.0,
                              color: golden800,
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/vectors/vector_1.png",
                                ),
                              ),
                            )
                          ],
                        ),
                      ] else ...[
                        Lottie.asset(
                          "assets/lottiesfiles/81148-new-message-notification.json",
                          height: 100.0,
                          width: 100.0,
                        ),
                      ],
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                          currentSteps == 0
                              ? "Entrez votre num??ro de t??l??phone pour activer votre compte !"
                              : "Veuillez entrer le code de validation envoy??e par sms ?? votre num??ro de t??l??phone !",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.dancingScript(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
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
            PageView(
              controller: pageController,
              onPageChanged: onPageChanged,
              children: steps,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }

  Widget firstStepAuth(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(10.0, 250.0, 10.0, 100.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.3),
                  blurRadius: 12.0,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomField(
                    prefix: "+243",
                    hintText: "Entrez votre n?? de t??l??chone...",
                    icon: CupertinoIcons.phone,
                    keyType: TextInputType.phone,
                    maxLgt: 9,
                    controller: textPhone,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.2),
                          blurRadius: 12.0,
                          offset: const Offset(0, 10.0),
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
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          if (textPhone.text.isEmpty) {
                            Get.snackbar(
                              "N?? de T??l??phone r??quis !",
                              "vous devez entrez votre num??ro de t??l??phone pour recevoir un code par sms d'activation de l'application !",
                              snackPosition: SnackPosition.BOTTOM,
                              colorText: Colors.white,
                              backgroundColor: Colors.black87,
                              maxWidth: MediaQuery.of(context).size.width - 4,
                              borderRadius: 30.0,
                              duration: const Duration(seconds: 4),
                            );
                            return;
                          }

                          Xloading.showLottieLoading(context);
                          await ApiManager.login(
                                  data: {"telephone": "+243" + textPhone.text})
                              .then((res) {
                            Xloading.dismiss();
                            if (res != null) {
                              print(res);
                              if (res['reponse']['status'] == "success") {
                                setState(() {
                                  currentSteps++;
                                });
                                pageController.animateToPage(
                                  currentSteps,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                              } else {
                                print("failed!");
                              }
                            }
                          });
                        },
                        borderRadius: BorderRadius.circular(50.0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
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
        ],
      ),
    );
  }

  FocusNode focusNode = FocusNode();
  Widget secondStepAuth(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(10.0, 250.0, 10.0, 100.0),
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.3),
                  blurRadius: 12.0,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.3),
                          blurRadius: 12.0,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: PinPut(
                      fieldsCount: 6,
                      controller: textCode,
                      focusNode: focusNode,
                      textStyle: GoogleFonts.lato(
                        fontSize: 18.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                      ),
                      selectedFieldDecoration: BoxDecoration(
                        border: Border.all(color: primaryColor, width: 2.0),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      eachFieldWidth: 40.0,
                      eachFieldHeight: 60.0,
                      onSubmit: (String pin) async {
                        if (pin.isNotEmpty) {
                          FocusScope.of(context).unfocus();
                          Xloading.showLottieLoading(context);
                          await ApiManager.login(data: {
                            "telephone": "+243" + textPhone.text,
                            "otp": pin
                          }).then((res) async {
                            Xloading.dismiss();
                            if (res != null) {
                              print(res);
                              if (res['error'] != null) {
                                Get.snackbar(
                                  "Echec !",
                                  "veuillez renvoyer le code au num??ro +243${textPhone.text}",
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: Colors.orange,
                                  backgroundColor: Colors.black87,
                                  maxWidth:
                                      MediaQuery.of(context).size.width - 4,
                                  borderRadius: 30,
                                  duration: const Duration(seconds: 4),
                                );
                                return;
                              }
                              if (res['reponse']['status'] == "success") {
                                storage.write("user_id",
                                    res["reponse"]["data"]["user_id"]);
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    PageTransition(
                                      child: const HomeScreen(),
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                    ),
                                    (Route<dynamic> route) => false);
                              } else {
                                setState(() {
                                  textCode.text = "";
                                });
                                Get.snackbar(
                                  "Echec !",
                                  "veuillez renvoyer le code au num??ro +243${textPhone.text}",
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: Colors.orange,
                                  backgroundColor: Colors.black87,
                                  maxWidth:
                                      MediaQuery.of(context).size.width - 4,
                                  borderRadius: 30,
                                  duration: const Duration(seconds: 4),
                                );
                                return;
                              }
                            }
                          });
                        }
                      },
                      submittedFieldDecoration: BoxDecoration(
                        color: Colors.grey[400],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.3),
                            blurRadius: 10.0,
                            offset: const Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      followingFieldDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.grey[400],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.3),
                            blurRadius: 10.0,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextButton(
                    onPressed: () async {
                      Xloading.showLottieLoading(context);
                      await ApiManager.login(
                              data: {"telephone": "+243" + textPhone.text})
                          .then((res) {
                        Xloading.dismiss();
                        if (res != null) {
                          print(res);
                          if (res['reponse']['status'] == "success") {
                            setState(() {
                              currentSteps++;
                            });
                          }
                        }
                      });
                    },
                    child: Text(
                      "R??envoyer le code",
                      style: GoogleFonts.lato(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
