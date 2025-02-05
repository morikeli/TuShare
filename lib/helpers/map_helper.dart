import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share/utils/constants/colors.dart';
import 'package:universe/universe.dart';


class MapHelper {
  static void showFullScreenMap(BuildContext context) {
    Get.to(
      () => FullScreenMapView(),
      transition: Transition.downToUp,
      duration: Duration(milliseconds: 1500),
    );
  }
}


class FullScreenMapView extends StatelessWidget {
  const FullScreenMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Stack(
          children: [
            U.OpenStreetMap(
              center: [-6.175329, 106.827253],
              type: OpenStreetMapType.HOT,
              zoom: 15,
            ),
            Positioned(
              top: 60,
              right: 16,
              child: IconButton.filled(
                tooltip: 'Exit fullscreen map',
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  elevation: WidgetStatePropertyAll(15.0),
                  shadowColor: WidgetStatePropertyAll(kSecondaryColor),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))
                ),
                icon: Icon(Icons.fullscreen_exit, color: kIconSecondaryColor),
                onPressed: () => Get.back(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}