import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class MapController extends GetxController {
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getUserLocation();
  }

  // Method to fetch user's current location
  Future<void> fetchLocation() async {
    isLoading(true);
    Position position = await Geolocator.getCurrentPosition();
    latitude.value = position.latitude;
    longitude.value = position.longitude;
  }

  Future<void> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        isLoading.value = false;
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        throw 'Location services disabled!';
        // return Future.error('Location services are disabled.');
      }
      
      isLoading(true);
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
        fetchLocation();
      } else if (permission == LocationPermission.denied) {
        // Request permission only if it was previously denied (but not forever)
        permission = await Geolocator.requestPermission();
        isLoading(true);
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          isLoading(false);
          
          // set longitude & latitude to Nairobi's coordinates
          latitude.value = -1.286389;
          longitude.value = 36.817223;
          
          throw 'Location permissions are denied';
        } else {
          fetchLocation();
        }

      } else if (permission == LocationPermission.deniedForever) {
        isLoading(false);
        // Permissions are denied forever, handle appropriately.
        
        // set default location to Nairobi
        latitude.value = -1.286389;
        longitude.value = 36.817223;
        throw 'Location permissions are permanently denied, we cannot request permissions.';
      }

    } catch (e) {
      // display error message in a snackbar
      Get.showSnackbar(
        GetSnackBar(
        backgroundColor: Colors.transparent,
        duration: Duration(seconds: 7),
        messageText: AwesomeSnackbarContent(
          title: 'Oops!',
          message: '$e',
          contentType: ContentType.failure,
        ),
      ));
      
    } finally {
      isLoading(false);
    }
  }
}
