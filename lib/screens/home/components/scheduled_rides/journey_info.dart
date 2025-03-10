import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/utils/constants/colors.dart';

class ScheduledRideJourneyInfo extends StatelessWidget {
  const ScheduledRideJourneyInfo({
    super.key,
    required this.pickupPoint,
    required this.destination,
    required this.availableSeats,
  });
  final String pickupPoint, destination, availableSeats;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(LineIcons.dotCircle, color: Colors.red),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .44,
                    child: Text.rich(
                      maxLines: 2,
                      softWrap: true,
                      TextSpan(
                        text: pickupPoint,
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: '  (pickup point)',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(LineIcons.mapPin, color: Colors.green),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .4,
                    child: Text.rich(
                      maxLines: 2,
                      softWrap: true,
                      TextSpan(
                        text: destination,
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: '  (destination)',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    LineIcons.user,
                    color: Colors.red,
                    size: 16.0,
                  ),
                  Icon(
                    LineIcons.user,
                    color: kIconSecondaryColor,
                    size: 16.0,
                  ),
                  Icon(
                    LineIcons.user,
                    color: kIconSecondaryColor,
                    size: 16.0,
                  ),
                ],
              ),
              Column(
                children: [
                  Text('$availableSeats seat(s)', softWrap: true),
                  Text('available', softWrap: true),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
