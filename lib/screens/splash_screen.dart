import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myapp/screens/onboard_screen1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
void initState() {
  super.initState();

  Future.delayed(
    Duration(seconds: 3),
    () {

      Navigator.pushReplacement(
        context,

        MaterialPageRoute(
          builder: (context) => OnboardScreenOne(),
        ),
      );

    },
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),

      body: SizedBox(
        width: double.infinity,
        height: double.infinity,

        child: Column(
          children: [

            // IMAGE SECTION
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),

                child: Stack(
                  fit: StackFit.expand,

                  children: [

                    // BACKGROUND IMAGE
                    Image.asset(
                      "assets/images/splash.png",
                      fit: BoxFit.cover,
                    ),

                    // DARK OVERLAY
                    Container(
                      color: Colors.black.withOpacity(0.25),
                    ),

                    // TOP TITLE
                    Positioned(
                      top: 50,
                      left: 0,
                      right: 0,

                      child: Column(
                        children: [

                          Text(
                            "FITMIND",

                            style: TextStyle(
                              fontFamily: "Bebas",
                              color: Color(0xFFD7FF00),
                              fontSize: 64,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1,
                              height: 1,
                            ),
                          ),

                          SizedBox(height: 8),

                          Text(
                            "YOUR PERSONAL AI FITNESS JOURNEY",

                            textAlign: TextAlign.center,

                            style: TextStyle(
                              fontFamily: "Bebas",
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // BOTTOM TEXT
                    Positioned(
                      bottom: 50,
                      left: 0,
                      right: 0,

                      child: Column(
                        children: [

                          Text(
                            "BUILT TO\nIMPROVE",

                            textAlign: TextAlign.center,

                            style: TextStyle(
                              fontFamily: "Bebas",
                              color: Colors.white,
                              fontSize: 42,
                              fontWeight: FontWeight.w900,
                              height: 1,
                              letterSpacing: 1,
                            ),
                          ),

                          SizedBox(height: 10),

                          RichText(
                            text: TextSpan(
                              children: [

                                TextSpan(
                                  text: "MOVE BETTER.",

                                  style: TextStyle(
                                    color: Color(0xFFD7FF00),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    fontFamily: "Bebas",
                                  ),
                                ),

                                TextSpan(
                                  text: " THINK STRONGER.",

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    fontFamily: "Bebas",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // LOADING AREA
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.black,

              child: Align(
                alignment: Alignment.topCenter,

                child: Padding(
                  padding: EdgeInsets.only(top: 1),

                  child: SizedBox(
                    width: 45,
                    height: 45,

                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      color: Color(0xFFD7FF00),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}