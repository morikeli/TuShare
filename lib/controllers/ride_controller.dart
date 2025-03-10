import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:get/get.dart';
import 'package:ride_share/common/widgets/custom_snackbar.dart';
import '../models/ride.dart';
import '../services/ride_service.dart';

class RideController extends GetxController {
  var availableRides = <Ride>[].obs;    // Observable list of available ridesdestination
  var bookedRides = <Ride>[].obs;   // Observable list of booked rides
  var isLoading = false.obs;  // Loading state


  final RideService _rideService = RideService();

  @override
  void onInit() {
    fetchBookedRides();     // automatically  fetch current user's booked rides
    super.onInit();
  }

  // Fetches available rides for a given destination
  Future<void> fetchAvailableRides(String destination) async {
    isLoading(true);    // Show loading indicator
    try {
      var rides = await _rideService.getAvailableRides(destination);
      availableRides.assignAll(rides); // Update available rides list
    } finally {
      isLoading(false);   // Hide loading indicator
    }
  }

  // Fetches rides booked by the current user
  Future<void> fetchBookedRides() async {
    isLoading(true);
    try {
      var rides = await _rideService.getUserBookedRides();
      bookedRides.assignAll(rides);
      update();   // notify UI to update
    } catch (e) {
      throw Exception("Error fetching booked rides: $e");
    } finally {
      isLoading(false);
    }
  }

  // Books a ride and updates booked rides list
  Future<void> bookRide(String rideId) async {
    isLoading(true);
    bool success = await _rideService.bookRide(rideId);
    if (success) {
      fetchBookedRides();     // Refresh booked rides list
      Get.snackbar("Wohoo! 🥳🥳", "Ride booked successfully!");
      final RxMap<String, dynamic> message = {"title": "Success", "message": "Ride booked successfully!", "type": ContentType.success}.obs;
      CustomSnackbar(snackbarMessage: message);
    } else {
      Get.snackbar("Error", "Failed to book ride");
      final RxMap<String, dynamic> message = {"title": "Oh snap!", "message": "Unable to book your ride. Please try again later.", "type": ContentType.failure}.obs;
      CustomSnackbar(snackbarMessage: message);
    }
    isLoading(false);
  }
}
