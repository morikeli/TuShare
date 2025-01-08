import 'package:flutter/material.dart';

class RidesScreen extends StatefulWidget {
  const RidesScreen({super.key});

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen>
    with SingleTickerProviderStateMixin {
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
        elevation: 0,
        title: Text('My rides', style: Theme.of(context).textTheme.titleLarge),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'For You'),
            Tab(text: 'Upcoming rides'),
            Tab(text: 'History'),
          ],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: TabBarView(
          controller: _tabController,
          children: [
            Center(
              child: Text('For You', style: Theme.of(context).textTheme.headlineSmall),
            ),
            Center(
              child: Text('Upcoming rides', style: Theme.of(context).textTheme.headlineSmall),
            ),
            Center(
              child: Text('History', style: Theme.of(context).textTheme.headlineSmall),
            ),
          ],
        ),
      ),
    );
  }
}
