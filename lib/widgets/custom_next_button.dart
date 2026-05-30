import 'package:flutter/material.dart';

class CustomNextButton extends StatelessWidget {

  final VoidCallback onTap;

  const CustomNextButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: Column(
        children: [

          // NEXT BUTTON
          Container(
            width: 320,
            height: 58,

            decoration: BoxDecoration(
              color: Color(0xFFD7FF00),
              borderRadius: BorderRadius.circular(18),
            ),

            child: Center(
              child: Text(
                "NEXT",

                style: TextStyle(
                  fontFamily: "Bebas",
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),

          SizedBox(height: 10),
        ],
      ),
    );
  }
}