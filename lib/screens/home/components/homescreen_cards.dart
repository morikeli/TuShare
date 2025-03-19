import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/controllers/ride_controller.dart';
import 'package:ride_share/utils/constants/api_endpoints.dart';
import 'package:ride_share/utils/constants/colors.dart';

class HomeScreenCards extends StatelessWidget {
  HomeScreenCards({
    super.key,
  });
  final RideController rideController = Get.put(RideController());    // Inject controller
  final TextEditingController searchController = TextEditingController();     // Controller for search input

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchForAvailableRidesTextField(),     // text field to search for available rides
        searchResults(context),
      ],
    );
  }

  Widget searchResults(BuildContext context) {
    return Expanded(
      child: Obx(() {
        if (rideController.isLoading.value) {
          return Center(
            child: SpinKitFadingCircle(color: kPrimaryColor, size: 68.0),   // if screen is loading, show indicator
          );
        }

        if (rideController.availableRides.isEmpty) {
          return ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * .16),
                    Icon(LineIcons.searchLocation, size: 48.0),
                    Text('No data available'),
                  ],
                ),
              ),
            ],
          );
        }
        return availableRidesSearchResults();
      }),
    );
  }

  Widget availableRidesSearchResults() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 72.0),
        itemCount: rideController.availableRides.length,
        itemBuilder: (context, index) {
          final availableRide = rideController.availableRides[index];
          return Card(
            // shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
            color: Theme.of(context).cardColor,
            child: Column(
              children: [
                cardHeader(
                  context,
                  availableRide.driverName,
                  availableRide.driverProfilePic,
                  availableRide.vehicleModel,
                  availableRide.vehiclePlate,
                ),
                cardBodySection(
                  context,
                  availableRide.destination,
                  availableRide.departureLocation,
                  availableRide.availableSeats,
                ),
                // Divider(color: Colors.black26),
                cardFooter(
                  context,
                  availableRide.departureTime,
                  availableRide.pricePerSeat,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget searchForAvailableRidesTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: "Enter destination ...",
          prefixIcon: Icon(LineIcons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onChanged: (value) {
          // updated search results as the user types in their desired location
          if (value.isNotEmpty) {
            rideController.fetchAvailableRides(value);
          }
        },
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            rideController.fetchAvailableRides(value);
          }
        },
      ),
    );
  }

  Widget cardFooter(BuildContext context, String departureTime, int price) {
    DateTime dateTime = DateTime.parse(departureTime);
    String formattedTime =
        DateFormat.jm().format(dateTime); // format the time using intl package

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                formattedTime,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                'PICKUP TIME',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          Column(
            children: [
              Text('\$ $price', style: Theme.of(context).textTheme.labelLarge),
              Text('PER SEAT', style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              LineIcons.comment,
              color: kIconSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget cardBodySection(
    BuildContext context,
    String destination,
    String pickupPoint,
    int availableSeats,
  ) {
    return ListTile(
      title: Row(
        children: [
          Icon(LineIcons.dotCircle, color: Colors.red),
          Expanded(
            child: Text.rich(
              // textAlign: TextAlign.center,
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
      subtitle: Row(
        children: [
          Icon(LineIcons.mapPin, color: Colors.green),
          Expanded(
            child: Text.rich(
              // textAlign: TextAlign.center,
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
      ),
      trailing: Column(
        children: [
          Text(
            '$availableSeats seat(s)',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text('available', style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }

  Widget cardHeader(
    BuildContext context,
    String driversName,
    String driverProfilePic,
    String vehicleModel,
    String vehiclePlate,
  ) {
    final mediaUrl = ApiConstants.mediaURL;
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage('$mediaUrl/$driverProfilePic'),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            driversName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container(
            padding: EdgeInsets.zero,
            height: 24.0,
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(kPrimaryColor),
                padding: WidgetStateProperty.all(const EdgeInsets.all(2.0)),
                shape: WidgetStateProperty.all(
                  BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
              child: Text(
                'Request',
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
            ),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(vehicleModel, style: TextStyle(color: kTextSecondaryColor)),
          Text(
            'Plate no. $vehiclePlate',
            style: TextStyle(color: kTextSecondaryColor),
          ),
        ],
      ),
    );
  }
}
