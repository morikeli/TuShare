import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share/screens/home/components/scheduled_rides/card_ribbon.dart';
import 'package:ride_share/screens/home/components/scheduled_rides/journey_info.dart';
import 'package:ride_share/screens/home/components/scheduled_rides/passengers.dart';
import 'package:ride_share/screens/slot/car_slot.dart';

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
        return GestureDetector(
          onTap: () => Get.to(
            () => CarSlot(),
            transition: Transition.rightToLeft,
            duration: Duration(milliseconds: 1500),
          ),
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ScheduledRideCardBanner(
                    vehicleModel: bookedRide.vehicleModel,
                    availableSeats: bookedRide.availableSeats.toString(),
                  ),
                  ScheduledRideJourneyInfo(
                    pickupPoint: bookedRide.departureLocation,
                    destination: bookedRide.destination,
                    availableSeats: bookedRide.availableSeats.toString(),
                  ),
                  Divider(color: Theme.of(context).dividerColor),
                  ScheduledRidePassengers(
                    driverName: bookedRide.driverName,
                    driverProfilePic: bookedRide.driverProfilePic,
                    driverOrigin: bookedRide.departureLocation,
                    passengers: bookedRide.passengers,
                    price: bookedRide.pricePerSeat.toString(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
