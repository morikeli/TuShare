import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/controllers/map_controller.dart';
import 'package:ride_share/helpers/map_helper.dart';
import 'package:ride_share/utils/constants/colors.dart';
import 'package:universe/universe.dart' hide MapController;

class MapWidget extends StatelessWidget {
  final MapController mapController = Get.put(MapController());

  MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // display a loading indicator when the map is loading
      if (mapController.isLoading.value) {
        return Center(child: SpinKitThreeBounce(color: kPrimaryColor, size: 68.0));
      }
      // return map if its loaded
      return Stack(
        children: [
          U.OpenStreetMap(
            center: [
              mapController.latitude.value,
              mapController.longitude.value
            ],
            type: OpenStreetMapType.HOT,
            zoom: 14,
            markers: U.MarkerLayer(
              data: 'The pin shows your current location',
              [
                // marker to display user's current location
                U.Marker(
                  [mapController.latitude.value, mapController.longitude.value],
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
          Positioned(
            top: 60,
            right: 16,
            child: IconButton.filled(
              tooltip: 'View map in fullscreen',
              style: fullscreenButtonStyle(),
              icon: Icon(Icons.fullscreen, color: kIconSecondaryColor),
              onPressed: () => MapHelper.showFullScreenMap(context),
            ),
          ),
        ],
      );
    });
  }

  ButtonStyle fullscreenButtonStyle() {
    return ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.white),
      elevation: WidgetStatePropertyAll(15.0),
      shadowColor: WidgetStatePropertyAll(kSecondaryColor),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
