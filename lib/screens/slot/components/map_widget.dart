import 'package:flutter/material.dart';
import 'package:ride_share/helpers/map_helper.dart';
import 'package:ride_share/utils/constants/colors.dart';
import 'package:universe/universe.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            tooltip: 'View map in fullscreen',
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
              elevation: WidgetStatePropertyAll(15.0),
              shadowColor: WidgetStatePropertyAll(kSecondaryColor),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))
            ),
            icon: Icon(Icons.fullscreen, color: kIconSecondaryColor),
            onPressed: () => MapHelper.showFullScreenMap(context),
          ),
        ),
      ],
    );
  }
}
