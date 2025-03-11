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

  // Generates a list of Positioned CircleAvatars for passengers dynamically
  List<Widget> _buildPassengerAvatars() {
    // Define positions based on a standard 4-seat layout
    List<Map<String, dynamic>> positions = [
      {'left': 140.0, 'top': 68.0},     // Front-right seat
      {'right': 104.0, 'top': 68.0},    // Back-right seat
      {'right': 104.0, 'bottom': 80.0}, // Back-left seat
    ];

    List<Widget> avatars = [];
    for (int i = 0; i < passengersProfilePic.length && i < positions.length; i++) {
      avatars.add(
        Positioned(
          left: positions[i].containsKey('left') ? positions[i]['left'] : null,
          right: positions[i].containsKey('right') ? positions[i]['right'] : null,
          top: positions[i].containsKey('top') ? positions[i]['top'] : null,
          bottom: positions[i].containsKey('bottom') ? positions[i]['bottom'] : null,
          child: CircleAvatar(
            radius: 20.0,
            backgroundImage: NetworkImage(
              "${ApiConstants.mediaURL}/${passengersProfilePic[i]}",
            ),
          ),
        ),
      );
    }
    return avatars;
  }
}
