import 'package:flutter/material.dart';
import 'package:ride_share/models/ride.dart';
import 'package:ride_share/screens/slot/components/map_widget.dart';
import 'package:ride_share/screens/slot/components/passengers_sitting_position.dart';
import 'package:ride_share/screens/slot/components/passengers_tab.dart';


class CarSlot extends StatefulWidget {
  const CarSlot({
    super.key,
    required this.driverName,
    required this.bookedRide,
    required this.totalPassengers,
  });
  final String driverName;
  final Ride bookedRide;
  final int totalPassengers;

  @override
  State<CarSlot> createState() => _CarSlotState();
}

class _CarSlotState extends State<CarSlot> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Extract passenger profile pictures from API data
    List<String> passengerImages = widget.bookedRide.passengers
        .map((passenger) => passenger.profilePic)
        .toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Car slots'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              // Since the driver's name is displayed, we need to deduct 1 passenger from totalPassengers
              widget.totalPassengers - 1 == 0
                  ? 'Sharing a ride with ${widget.driverName}' // show passengers name if there are 2 passengers
                  : 'Sharing a ride with ${widget.driverName} and ${widget.totalPassengers - 1} other(s)',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 12.0),
          VehicleImageAndPassengersSittingPositions(
            passengersProfilePic: passengerImages,
            driverProfilePic: widget.bookedRide.driverProfilePic,
          ),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Passengers'),
              Tab(text: 'Trip details'),
              Tab(text: 'Route'),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .5,
            child: TabBarView(
              controller: _tabController,
              children: [
                PassengersTab(
                  driverName: widget.bookedRide.driverName,
                  driverProfilePic: widget.bookedRide.driverProfilePic,
                  driverOrigin: widget.bookedRide.departureLocation,
                  passengers: widget.bookedRide.passengers,
                  price: widget.bookedRide.pricePerSeat.toString(),
                ),
                Center(child: Text('Coming soon')),
                MapWidget(),  // display map showing the routes the car will go through
              ],
            ),
          ),
        ],
      ),
    );
  }
}
