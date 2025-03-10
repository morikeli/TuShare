import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/utils/constants/colors.dart';

class ScheduledRideCardBanner extends StatelessWidget {
  const ScheduledRideCardBanner({
    super.key,
    required this.vehicleModel,
    required this.availableSeats,
  });
  final String vehicleModel, availableSeats;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 0,
          right: MediaQuery.of(context).size.width * .32,
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
            margin: EdgeInsets.symmetric(vertical: 12.0),
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(LineIcons.car, color: kIconLightColor, size: 18.0),
                SizedBox(width: 4.0),
                Text(vehicleModel, style: TextStyle(color: kTextLightColor)),
                VerticalDivider(),
                Icon(LineIcons.userFriends, color: kIconLightColor, size: 18.0),
                SizedBox(width: 4.0),
                Text('$availableSeats seat(s)', style: TextStyle(color: kTextLightColor)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(LineIcons.horizontalEllipsis),
              ),
            ],
          ),
        )
      ],
    );
  }
}
