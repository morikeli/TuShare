import 'package:flutter/material.dart';
import 'package:ride_share/utils/constants/colors.dart';


class ScheduledRidePassengers extends StatelessWidget {
  const ScheduledRidePassengers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
          minTileHeight: 5.0,
          leading: CircleAvatar(
            radius: 15.0,
            backgroundImage: AssetImage('assets/images/dps/2.jpg'),
          ),
          title: Row(
            children: [
              Text(
                'Sarah Johnson',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(width: 8.0),
              Container(
                height: 15.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.blue.shade900,
                  shape: BoxShape.rectangle
                ),
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
                child: Text('Driver', style: TextStyle(color: kTextLightColor, fontSize: 9.0)),
              )
            ],
          ),
          subtitle: Text('KNH', style: TextStyle(color: kTextSecondaryColor)),
          trailing: Text('\$ 10', style: Theme.of(context).textTheme.bodyMedium),
        ),
        
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
          leading: CircleAvatar(
            radius: 15.0,
            backgroundImage: AssetImage('assets/images/dps/18.jpg'),
          ),
          title: Text(
            'Yule msee',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          subtitle: Text(
            'Milimani Law courts',
            style: TextStyle(color: kTextSecondaryColor),
          ),
          trailing: Text(
            '\$ 8',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
          leading: CircleAvatar(
            radius: 15.0,
            backgroundImage: AssetImage('assets/images/dps/5.jpg'),
          ),
          title: Text('Kelvin Anderson', style: Theme.of(context).textTheme.bodyLarge),
          subtitle: Text('NHIF towers', style: TextStyle(color: kTextSecondaryColor)),
          trailing: Text('\$ 8', style: Theme.of(context).textTheme.bodyMedium),
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
          leading: CircleAvatar(
            radius: 15.0,
            backgroundImage: AssetImage('assets/images/dps/10.jpg'),
          ),
          title: Text('Brenda jones', style: Theme.of(context).textTheme.bodyLarge),
          subtitle: Text('Community stage', style: TextStyle(color: kTextSecondaryColor)),
          trailing: Text('\$ 8', style: Theme.of(context).textTheme.bodyMedium),
        ),
      ],
    );
  }
}

