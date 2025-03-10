import 'package:flutter/material.dart';
import 'package:ride_share/utils/constants/api_endpoints.dart';
import 'package:ride_share/utils/constants/colors.dart';


class ScheduledRidePassengers extends StatelessWidget {
  const ScheduledRidePassengers({
    super.key,
    required this.price,
    required this.driverName,
    required this.driverProfilePic,
    required this.driverOrigin,
    required this.totalPassengers,
    required this.passengers,
  });

  final String driverName,
      driverProfilePic,
      driverOrigin,
      price;
  final int totalPassengers;
  final List passengers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
          minTileHeight: 5.0,
          leading: CircleAvatar(
            radius: 15.0,
            backgroundImage: NetworkImage(
              '${ApiConstants.mediaURL}/$driverProfilePic',
            ),
          ),
          title: Row(
            children: [
              Text(
                driverName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(width: 8.0),
              Container(
                height: 15.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.blue.shade900,
                  shape: BoxShape.rectangle,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 1.0,
                ),
                child: Text(
                  'Driver',
                  style: TextStyle(color: kTextLightColor, fontSize: 9.0),
                ),
              )
            ],
          ),
          subtitle: Text(
            driverOrigin,   // driver's current location - where he/she start his journey
            style: TextStyle(color: kTextSecondaryColor),
          ),
        ),

        // a list of all passengers who booked this ride
        ...passengers.map((passenger) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
            minTileHeight: 5.0,
            leading: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage(
                '${ApiConstants.mediaURL}/${passenger.profilePic}',
              ),
            ),
            title: Row(
              children: [
                Text(
                  passenger.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(width: 8.0),
              ],
            ),
            subtitle: Text(
              passenger.pickupPoint,
              style: TextStyle(color: kTextSecondaryColor),
            ),
          );
        })
      ],
    );
  }
}
