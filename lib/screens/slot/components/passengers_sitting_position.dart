import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ride_share/utils/constants/api_endpoints.dart';
import 'package:ride_share/utils/constants/colors.dart';


class VehicleImageAndPassengersSittingPositions extends StatelessWidget {
  const VehicleImageAndPassengersSittingPositions({
    super.key,
    required this.passengersProfilePic,
    required this.driverProfilePic,
  });

  final List<String> passengersProfilePic;
  final String driverProfilePic;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Stack(
            children: [
              Transform.rotate(
                angle: pi,  // rotate the image in the opposite direction
                child: ClipRRect(
                  // since the image is rotated we need to use "bottomLeft" in place of topRight
                  // and "bottomRight" in place of topLeft
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
                  child: Image.asset(
                    'assets/images/top-view/car/car-top-view.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // driver's seat position - according to the image
              Positioned(
                left: 140,
                bottom: 80,
                child: CircleAvatar(
                  backgroundImage: NetworkImage( "${ApiConstants.mediaURL}/$driverProfilePic"),
                ),
              ),
              // passengers position
              ..._buildPassengerAvatars(),
            ],
          ),
          SizedBox(height: 12.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Text(
              'DISCLAIMER: Image is used for illustrative purpose. Actual vehicle may differ from the image shown above.',
              style: TextStyle(color: kTextSecondaryColor, fontSize: 13.0),
            ),
          ),
        ],
      ),
    );
  }
}
