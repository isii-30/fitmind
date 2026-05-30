
import 'onboard_screen2.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_next_button.dart';

class OnboardScreenOne extends StatelessWidget {
  const OnboardScreenOne({super.key});

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
                      "assets/images/onboardone.png",
                      fit: BoxFit.cover,
                    ),

                    // TOP LOGO
                    Positioned(
                      top: 60,
                      left: 100,

                      child: Row(
                        children: [

                          // LOGO IMAGE
                          Image.asset(
                            "assets/images/logo.png",
                            width: 55,
                          ),

                          SizedBox(width: 5),

                          // FITMIND TEXT
                          Text(
                            "FITMIND",

                            style: TextStyle(
                              fontFamily: "Bebas",
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // GLASS CARD
                    Positioned(
                      right: 20,
                      top: 290,

                      child: Container(
                        width: 220,
                        padding: EdgeInsets.all(18),

                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.65),

                          borderRadius: BorderRadius.circular(25),

                          border: Border.all(
                            color: Color(0xFFD7FF00),
                            width: 1,
                          ),
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            // ICON ROW
                            Row(
                              children: [

                                Icon(
                                  Icons.bar_chart,
                                  color: Color(0xFFD7FF00),
                                  size: 28,
                                ),

                                SizedBox(width: 8),

                                Icon(
                                  Icons.favorite,
                                  color: Color(0xFFD7FF00),
                                  size: 28,
                                ),
                              ],
                            ),

                            SizedBox(height: 10),

                            // HEADING
                            Text(
                              "TRACK EVERY\nWORKOUT",

                              style: TextStyle(
                                fontFamily: "Bebas",
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                height: 1,
                              ),
                            ),

                            SizedBox(height: 10),

                            // SUBTITLE
                            Text(
                              "SMART WORKOUT\nTRACKING",

                              style: TextStyle(
                                fontFamily: "Bebas",
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
                            ),

                            SizedBox(height: 10),

                            // DESCRIPTION
                            Text(
                              "MONITOR YOUR WORKOUTS\nAND DAILY\nPROGRESS WITH INTELLIGENT\nFITNESS TRACKING.",

                              style: TextStyle(
                                fontFamily: "Bebas",
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // BOTTOM SECTION
            Container(
              height: 120,
              width: double.infinity,
              color: Colors.black,

              child: Padding(
                padding: const EdgeInsets.only(top: 1),

                child: Column(
                  children: [

                  CustomNextButton(

  onTap: () {

    Navigator.push(

      context,

      MaterialPageRoute(
        builder: (context) => OnboardScreenTwo(),
      ),
    );
  },
),
SizedBox(height: 10),

                    // PAGE INDICATORS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Container(
                          width: 14,
                          height: 14,

                          decoration: BoxDecoration(
                            color: Color(0xFFD7FF00),
                            shape: BoxShape.circle,
                          ),
                        ),

                        SizedBox(width: 10),

                        Container(
                          width: 14,
                          height: 14,

                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),

                        SizedBox(width: 10),

                        Container(
                          width: 14,
                          height: 14,

                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}