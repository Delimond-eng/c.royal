import 'package:c_royal/settings/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'home/home_screens.dart';
import 'home/mon_royaume_page.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({Key key}) : super(key: key);

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  int currentImageIndex = 0;
  final PageController pageController = PageController(initialPage: 0);
  List<String> images = [
    "assets/lottiesfiles/king_2.json",
    "assets/lottiesfiles/king_1.json",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: const DecorationImage(
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            image: AssetImage("assets/shapes/shape_4.png"),
          ),
          gradient: LinearGradient(
            colors: [primaryColor, golden900],
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
          color: primaryColor.withOpacity(.6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentImageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 20.0),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Lottie.asset(
                              images[index],
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          if (index == 0) ...[
                            Text(
                              "Bienvenue cher Roi , chère Reine !",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.dancingScript(
                                fontSize: 35.0,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            )
                          ] else ...[
                            Text(
                              "Devenir un Roi(Reine) pour beneficier de plus de reduction !",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.dancingScript(
                                  fontSize: 20.0,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            )
                          ]
                        ],
                      ),
                    );
                  },
                  itemCount: images.length,
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < images.length; i++)
                          if (i == currentImageIndex)
                            SliderIndicator(true)
                          else
                            SliderIndicator(false),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                height: 100.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      golden800,
                      golden900,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      blurRadius: 10.0,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(8.0),
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
                    borderRadius: BorderRadius.circular(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 50.0,
                          width: 50.0,
                          child: Center(
                            child: Image.asset(
                              "assets/vectors/vector_1.png",
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Center(
                          child: Text(
                            "Mon Royaume",
                            style: GoogleFonts.dancingScript(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                height: 100.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      golden900,
                      golden800,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      blurRadius: 10.0,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50.0,
                          width: 50.0,
                          child: Center(
                            child: Image.asset(
                              "assets/vectors/vector_1.png",
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 20.0,
                                width: 20.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.3),
                                      blurRadius: 10.0,
                                      offset: const Offset(0, 3),
                                    )
                                  ],
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: golden900,
                                    size: 15.0,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                "Nouveau Royaume",
                                style: GoogleFonts.dancingScript(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
    );
  }
}

class SliderIndicator extends StatelessWidget {
  bool isActive;
  SliderIndicator(this.isActive, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 12 : 10,
      width: isActive ? 12 : 10,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isActive
              ? [golden900, golden800]
              : [
                  Colors.grey[400],
                  Colors.grey[500],
                ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
