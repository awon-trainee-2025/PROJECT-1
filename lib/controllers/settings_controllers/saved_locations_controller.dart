import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masaar/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SavedLocationsController extends GetxController {
  final SupabaseClient _supabase = Supabase.instance.client;

  var locations = [].obs;
  var isLoading = false.obs;

  // Fetch all locations for a specific customer
  Future<void> fetchLocations(String customerId) async {
    isLoading.value = true;
    try {
      final response = await _supabase
          .from('locations')
          .select()
          .eq('customer_id', customerId)
          .order('created_at', ascending: false);
      locations.value = response;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    isLoading.value = false;
  }

  // Insert a new location

  Future<void> insertLocation({
    required String locationName,
    required String city,
    required String address,
    String? additionalDetails,
    required String customerId,
  }) async {
    try {
      await _supabase.from('locations').insert({
        'location_name': locationName,
        'city': city,
        'address': address,
        'additional_details': additionalDetails,
        'customer_id': customerId,
      });
      fetchLocations(customerId);
      Get.snackbar('Success', 'Location added');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Delete a location by location_id

  Future<void> deleteLocation(int locationId, String customerId) async {
    final response = await _supabase;
    try {
      await _supabase.from('locations').delete().eq('location_id', locationId);
      fetchLocations(customerId);
      Get.snackbar('Success', 'Location deleted');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
