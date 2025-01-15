import 'package:flutter/material.dart';
import 'package:ride_share/common/widgets/appbar.dart';
import 'package:ride_share/screens/history/components/ride_stats.dart';


class RideHistory extends StatelessWidget {
  const RideHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sharedAppBar(context, 'Ride history', null),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RidesStats(),
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

