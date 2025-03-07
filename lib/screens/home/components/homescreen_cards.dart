import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/utils/constants/colors.dart';


class HomeScreenCards extends StatelessWidget {
  const HomeScreenCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 72.0),
          itemCount: 10, 
          itemBuilder: (context, index) => Card(
            // shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
            color: Theme.of(context).cardColor,
            child: Column(
              children: [
                cardHeader(context),
                cardBodySection(context),
                // Divider(color: Colors.black26),
                cardFooter(context),
              ],
            ),
          ),
        ),
      );
  }


  Widget cardFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('6 min', style: Theme.of(context).textTheme.labelLarge),
              Text('PICKUP', style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
          Column(
            children: [
              Text('\$ 12', style: Theme.of(context).textTheme.labelLarge),
              Text('PER KM', style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(LineIcons.comment, color: kIconSecondaryColor,))
        ],
      ),
    );
  }

  Widget cardBodySection(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Icon(LineIcons.dotCircle, color: Colors.red),
          Text('Britam Towers, Upper Hill', style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
      subtitle: Row(
        children: [
          Icon(LineIcons.mapPin, color: Colors.green),
          Text('Donholm', style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
      trailing: Column(
        children: [
          Text('2 seats', style: Theme.of(context).textTheme.bodySmall),
          Text('available', style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }

  Widget cardHeader(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/1.jpg'),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Sarah Johnson',
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
                shape: WidgetStateProperty.all(BeveledRectangleBorder(borderRadius: BorderRadius.circular(2.0)))
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
