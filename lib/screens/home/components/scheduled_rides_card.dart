import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ride_share/controllers/ride_controller.dart';
import 'package:ride_share/models/ride.dart';
import 'package:ride_share/screens/home/components/scheduled_rides/card_ribbon.dart';
import 'package:ride_share/screens/home/components/scheduled_rides/journey_info.dart';
import 'package:ride_share/screens/home/components/scheduled_rides/passengers.dart';
import 'package:ride_share/screens/slot/car_slot.dart';
import 'package:ride_share/utils/constants/colors.dart';

class ScheduledRidesCard extends StatelessWidget {
  ScheduledRidesCard({
    super.key,
  });

  final RideController rideController = Get.put(RideController()); // Inject controller

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () => rideController.fetchBookedRides(),
      child: currentUserBookedRides(context),
    );
  }

  Obx currentUserBookedRides(BuildContext context) {
    return Obx(() {
      // if screen is loading, show a loading indicator
      if (rideController.isLoading.value) {
        return Center(
          child: SpinKitFadingCircle(
            color: kPrimaryColor,
            size: 68.0,
          ),
        );
      }

      if (rideController.availableRides.isEmpty) {
        return Center(
          child: Text("You have not booked any rides."),
        );
      }

      return allUsersBookedRides(); // a list of all current user's booked rides
    });
  }

  Widget allUsersBookedRides() {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 72.0),
      itemCount: rideController.bookedRides.length,
      itemBuilder: (context, index) {
        final bookedRide = rideController.bookedRides[index];

        return GestureDetector(
          onTap: () => Get.to(
            () => CarSlot(),
            transition: Transition.rightToLeft,
            duration: Duration(milliseconds: 1500),
          ),
          child: cards(bookedRide, context),    // cards that show booked rides
        );
      },
    );
  }

  Card cards(Ride bookedRide, BuildContext context) {
    return Card(
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
    );
  }
}
