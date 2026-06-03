import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatelessWidget {
  const ProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/gym_background.png',
              fit: BoxFit.cover,
            ),
          ),

          // Dark Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 20),

Center(
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(
        'assets/images/logo.png',
        height: 50,
      ),

      const SizedBox(width: 12),

      const Text(
        "FITMIND",
        style: TextStyle(
          fontFamily: "Bebas",
          color: Colors.white,
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
),

const SizedBox(height: 10),

                  const Text(
                    "CREATE YOUR PROFILE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Main Form Container
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: const Color(0xFFD7FF00),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        // Profile Picture
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.white24,
                              child: Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),

                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.camera_alt),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "ADD PROFILE PICTURE",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 25),

                        // Personal Details
                        _sectionTitle("Personal Details"),

                        const SizedBox(height: 15),

                        _customField("Full Name"),

                        const SizedBox(height: 15),

                        Row(
                          children: [
                            Expanded(
                              child: _customField("Email"),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _customField("Age"),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        _selectorRow(
                          ["Male", "Female", "Other"],
                        ),

                        const SizedBox(height: 25),

                        // Body Metrics
                        _sectionTitle("Body Metrics"),

                        const SizedBox(height: 15),

                        Row(
                          children: [
                            Expanded(
                              child: _customField("Height (CM)"),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _customField("Weight (KG)"),
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),

                        // Preferences
                        _sectionTitle("Preferences"),

                        const SizedBox(height: 15),

                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Fitness Goal",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        const SizedBox(height: 8),

                        _selectorRow(
                          [
                            "Fat Loss",
                            "Muscle Gain",
                            "Maintain",
                          ],
                        ),

                        const SizedBox(height: 20),

                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Fitness Level",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        const SizedBox(height: 8),

                        _selectorRow(
                          [
                            "Beginner",
                            "Intermediate",
                            "Advanced",
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Complete Button
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD7FF00),
                      ),
                      child: const Text(
                        "COMPLETE PROFILE",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static Widget _customField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  static Widget _selectorRow(List<String> items) {
    return Row(
      children: items.map((item) {
        return Expanded(
          child: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFD7FF00)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                item,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}