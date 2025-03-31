import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/common/widgets/appbar.dart';
import 'package:ride_share/screens/home/components/available_rides.dart';
import 'package:ride_share/screens/home/components/scheduled_rides_card.dart';
import 'package:ride_share/utils/constants/colors.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sharedAppBar(context, 'TuShare', LineIcons.alternateCar),
      body: homeBody(context),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Share your ride',
        onPressed: () {},
        child: Icon(
          LineIcons.shareSquareAlt,
          color: kIconLightColor,
        ),
      ),
    );
  }

  Widget homeBody(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'My Rides'),
            Tab(text: 'Discover'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              Scrollbar(child: ScheduledRidesCard()),
              Scrollbar(child: AvailableRides()),
            ],
          ),
        ),
      ],
    );
  }
}
