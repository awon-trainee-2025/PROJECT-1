import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AccountController extends GetxController {
  Rxn<Map<String, dynamic>> profile = Rxn<Map<String, dynamic>>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  final SupabaseClient supabase = Supabase.instance.client;

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }

  static String getFullName({
    required String firstName,
    required String lastName,
  }) {
    return '$firstName $lastName'.trim();
  }

  Future<void> loadUserProfile() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) return;

      final response =
          await supabase
              .from('Customers')
              .select()
              .eq('email', user.email!)
              .maybeSingle();

      if (response != null) {
        profile.value = response;
        loadProfileIntoFields();
      }
    } catch (e) {
      debugPrint('Error loading profile: $e');
    }
  }

  void loadProfileIntoFields() {
    final data = profile.value;
    if (data != null) {
      firstNameController.text = data['first_name'] ?? '';
      lastNameController.text = data['last_name'] ?? '';
      phoneController.text = data['phone_number']?.toString() ?? '';
      emailController.text = data['email'] ?? '';
    }
  }

  Future<void> updateProfile() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) return;

      final updatedData = {
        'first_name': firstNameController.text.trim(),
        'last_name': lastNameController.text.trim(),
        'phone_number': phoneController.text.trim(),
        'email': emailController.text.trim(),
      };

      await supabase
          .from('Customers')
          .update(updatedData)
          .eq('email', user.email!);

      await loadUserProfile();

      Get.snackbar(
        'Success',
        'Profile updated successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      debugPrint('Error updating profile: $e');
      Get.snackbar(
        'Error',
        'Failed to update profile',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }
}
