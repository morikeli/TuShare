import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/utils/constants/colors.dart';


class ScheduledRideJourneyInfo extends StatelessWidget {
  const ScheduledRideJourneyInfo({
    super.key,
  });

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
                  Text('Upper hill, Nairobi',
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              Row(
                children: [
                  Icon(LineIcons.mapPin, color: Colors.green),
                  Text('Donholm',
                      style: Theme.of(context).textTheme.bodyMedium),
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
                  Text('2 seats', softWrap: true),
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

