import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/common/widgets/icon_badge.dart';
import 'package:ride_share/screens/home/components/homescreen_cards.dart';
import 'package:ride_share/screens/home/components/scheduled_rides_card.dart';


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
      appBar: appBar(context),
      body: homeBody(context),
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
              ScheduledRidesCard(),
              HomeScreenCards(),
            ],
          ),
        ),
      ],
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(LineIcons.car),
          Text('TuShare', style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Stack(
            children: [Icon(LineIcons.bell), IconBadge()],
          ),
        ),
      ],
    );
  }
}