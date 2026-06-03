import 'package:flutter/material.dart';
import 'package:myapp/screens/profile_setup_screen.dart';
import 'package:myapp/widgets/custom_next_button.dart';

class OnboardScreenthree extends StatelessWidget {
  const OnboardScreenthree({super.key});

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
                      "assets/images/onboardthree.png",
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
                      left: 20,
                      bottom: 40,

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
                                  Icons.fitness_center,
                                  color: Color(0xFFD7FF00),
                                  size: 28,
                                ),

                                SizedBox(width: 8),

                                Icon(
                                  Icons.sports_gymnastics,
                                  color: Color(0xFFD7FF00),
                                  size: 28,
                                ),
                              ],
                            ),

                            SizedBox(height: 10),

                            // HEADING
                            Text(
                              "BUILD STRENGTH\nAND DISCIPLINE",

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
                              "YOUR JOURNEY TO RESILIENT\nBODY AND MIND",

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
                              "TRANSFORM YOUR BODY AND\nMIND\nTHROUGH CONSISTENT\nTRAINING",

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

                        // NEXT BUTTON
 CustomNextButton(

  onTap: () {

    Navigator.push(

      context,

      MaterialPageRoute(
        builder: (context) => ProfileSetupScreen(),
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

                        SizedBox(width: 10),

                        Container(
                          width: 14,
                          height: 14,

                          decoration: BoxDecoration(
                            color: Color(0xFFD7FF00),
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