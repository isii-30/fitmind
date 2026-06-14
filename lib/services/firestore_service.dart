import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserProfile({
    required String fullName,
    required String email,
    required int age,
    required String gender,
    required int height,
    required double weight,
    required String fitnessGoal,
    required String fitnessLevel,
  }) async {
    await _firestore.collection('users').add({
      'fullName': fullName,
      'email': email,
      'age': age,
      'gender': gender,
      'height': height,
      'weight': weight,
      'fitnessGoal': fitnessGoal,
      'fitnessLevel': fitnessLevel,
      'createdAt': Timestamp.now(),
    });
  }
}