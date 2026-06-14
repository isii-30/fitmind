import 'package:flutter/material.dart';
import '../services/firestore_service.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/screens/home_screen.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  String? selectedGender;
  String? selectedGoal;
  String? selectedLevel;

  String? genderError;
  String? goalError;
  String? levelError;

  File? _selectedImage;
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

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
            child: Container(color: Colors.black.withOpacity(0.6)),
          ),

          SafeArea(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/logo.png', height: 50),

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
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.white24,
                                backgroundImage: _selectedImage != null
                                    ? FileImage(_selectedImage!)
                                    : null,
                                child: _selectedImage == null
                                    ? const Icon(
                                        Icons.person,
                                        size: 50,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),

                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                  onPressed: _pickImage,
                                  icon: const Icon(Icons.camera_alt),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            "ADD PROFILE PICTURE",
                            style: TextStyle(color: Colors.white),
                          ),

                          const SizedBox(height: 25),

                          // Personal Details
                          _sectionTitle("Personal Details"),

                          const SizedBox(height: 15),

                          _customField("Full Name", _fullNameController),

                          const SizedBox(height: 15),

                          Row(
                            children: [
                              Expanded(
                                child: _customField("Email", _emailController),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _customField("Age", _ageController),
                              ),
                            ],
                          ),

                          const SizedBox(height: 15),

                          _selectorRow(
                            ["Male", "Female", "Other"],
                            selectedGender,
                            (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                          if (genderError != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                genderError!,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),

                          const SizedBox(height: 25),

                          // Body Metrics
                          _sectionTitle("Body Metrics"),

                          const SizedBox(height: 15),

                          Row(
                            children: [
                              Expanded(
                                child: _customField(
                                  "Height (CM)",
                                  _heightController,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _customField(
                                  "Weight (KG)",
                                  _weightController,
                                ),
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
                            ["Fat Loss", "Muscle Gain", "Maintain"],
                            selectedGoal,
                            (value) {
                              setState(() {
                                selectedGoal = value;
                              });
                            },
                          ),

                          if (goalError != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                goalError!,
                                style: const TextStyle(color: Colors.red),
                              ),
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
                            ["Beginner", "Intermediate", "Advanced"],
                            selectedLevel,
                            (value) {
                              setState(() {
                                selectedLevel = value;
                              });
                            },
                          ),
                          if (levelError != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                levelError!,
                                style: const TextStyle(color: Colors.red),
                              ),
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
                        onPressed: () async {
                          setState(() {
                            genderError = selectedGender == null
                                ? "Please select a gender"
                                : null;

                            goalError = selectedGoal == null
                                ? "Please select a fitness goal"
                                : null;

                            levelError = selectedLevel == null
                                ? "Please select a fitness level"
                                : null;
                          });

                          if (_formKey.currentState!.validate() &&
                              genderError == null &&
                              goalError == null &&
                              levelError == null) {
                            await FirestoreService().saveUserProfile(
                              fullName: _fullNameController.text,
                              email: _emailController.text,
                              age: int.parse(_ageController.text),
                              gender: selectedGender!,
                              height: int.parse(_heightController.text),
                              weight: double.parse(_weightController.text),
                              fitnessGoal: selectedGoal!,
                              fitnessLevel: selectedLevel!,
                            );
                            if (context.mounted) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            }
                          }
                        },
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

  Widget _customField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,

      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label is required';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _selectorRow(
    List<String> items,
    String? selectedValue,
    Function(String) onSelected,
  ) {
    return Row(
      children: items.map((item) {
        return Expanded(
          child: GestureDetector(
            onTap: () => onSelected(item),
            child: Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: selectedValue == item
                    ? const Color(0xFFD7FF00)
                    : Colors.transparent,
                border: Border.all(color: const Color(0xFFD7FF00)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  item,
                  style: TextStyle(
                    color: selectedValue == item ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
