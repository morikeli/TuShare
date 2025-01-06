import 'package:flutter/material.dart';
import 'package:ride_share/screens/home/components/scheduled_rides/card_ribbon.dart';
import 'package:ride_share/screens/home/components/scheduled_rides/journey_info.dart';
import 'package:ride_share/screens/home/components/scheduled_rides/passengers.dart';


class ScheduledRidesCard extends StatelessWidget {
  const ScheduledRidesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 72.0),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ScheduledRideCardBanner(),
                ScheduledRideJourneyInfo(),
                Divider(color: Theme.of(context).dividerColor),
                ScheduledRidePassengers(),
              ],
            ),
          ),
        );
      }
    );
  }
}
