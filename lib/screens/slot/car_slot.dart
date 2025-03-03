import 'package:flutter/material.dart';
import 'package:ride_share/screens/slot/components/map_widget.dart';
import 'package:ride_share/screens/slot/components/passengers_sitting_position.dart';
import 'package:ride_share/screens/slot/components/passengers_tab.dart';


class CarSlot extends StatefulWidget {
  const CarSlot({super.key});

  @override
  State<CarSlot> createState() => _CarSlotState();
}

class _CarSlotState extends State<CarSlot>  with SingleTickerProviderStateMixin {
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
            child: Text('Sharing ride with Sarah Johnson and 2 others', style: Theme.of(context).textTheme.bodyMedium),
          ),
          SizedBox(height: 12.0),
          VehicleImageAndPassengersSittingPositions(),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Passengers',),
              Tab(text: 'Trip details'),
              Tab(text: 'Route'),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .5,
            child: TabBarView(
              controller: _tabController,
              children: [
                PassengersTab(),
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
