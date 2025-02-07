import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/utils/constants/colors.dart';
import 'package:ride_share/controllers/map_controller.dart';
import 'package:universe/universe.dart' hide MapController;
// import 'package:geolocator/geolocator.dart';

class MapHelper {
  // show map in fullscreen
  static Future<void> showFullScreenMap(BuildContext context) async {
    MapController mapController = Get.find<MapController>();
    // Call the getUserLocation method from MapController
    await mapController.getUserLocation(); // Ensure location is fetched

    Get.to(
      () => FullScreenMapView(
        latitude: mapController.latitude.value,
        longitude: mapController.longitude.value,
      ),
      transition: Transition.downToUp,
      duration: Duration(milliseconds: 1500),
    );
  }
}

class FullScreenMapView extends StatelessWidget {
  final double latitude;
  final double longitude;

  const FullScreenMapView(
      {super.key, required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Stack(
          children: [
            U.OpenStreetMap(
              center: [latitude, longitude],
              type: OpenStreetMapType.HOT,
              zoom: 17,
              markers: U.MarkerLayer(
                data: 'The pin shows your current location',
                [
                  // marker to display user's current location
                  U.Marker(
                    [latitude, longitude],
                    widget: MarkerIcon(
                      icon: LineIcons.mapPin,
                      color: Colors.red,
                    ),
                  ),
                ],
                onTap: (latlng, data) {
                  // when the user taps the marker, display snackbar with info in `data`
                  Get.showSnackbar(GetSnackBar(
                    backgroundColor: Colors.transparent,
                    duration: Duration(seconds: 7),
                    messageText: AwesomeSnackbarContent(
                      title: 'You popped me!',
                      message: '$data',
                      messageTextStyle: TextStyle(fontSize: 16.0),
                      contentType: ContentType.help,
                    ),
                  ));
                },
              ),
            ),
            // button to exit fullscreen
            Positioned(
              top: 60,
              right: 16,
              child: IconButton.filled(
                tooltip: 'Exit fullscreen map',
                style: fullscreenBtnButtonStyle(),
                icon: Icon(Icons.fullscreen_exit, color: kIconSecondaryColor),
                onPressed: () => Get.back(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle fullscreenBtnButtonStyle() {
    return ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.white),
      elevation: WidgetStatePropertyAll(15.0),
      shadowColor: WidgetStatePropertyAll(kSecondaryColor),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
