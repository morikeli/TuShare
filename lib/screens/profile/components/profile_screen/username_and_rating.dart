import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/utils/constants/colors.dart';


class UsernameAndRatingWidget extends StatelessWidget {
  const UsernameAndRatingWidget({
    super.key,
    required this.firstName,
    required this.lastName,
  });

  final String firstName, lastName;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 12,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$firstName $lastName',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Row(
              children: [
                Icon(LineIcons.starAlt, color: Colors.yellow, size: 16.0),
                Icon(LineIcons.starAlt, color: Colors.yellow, size: 16.0),
                Icon(LineIcons.starAlt, color: Colors.yellow, size: 16.0),
                Icon(LineIcons.starHalf, color: Colors.yellow, size: 16.0),
                Icon(LineIcons.star, color: kIconLightColor, size: 16.0),
                SizedBox(width: 8.0),
                Text('3.5', style: TextStyle(color: kTextLightColor)),
                SizedBox(width: 12.0),
                Icon(LineIcons.userFriends, color: kIconLightColor),
                SizedBox(width: 8.0),
                Text('70 passengers', style: TextStyle(color: kTextLightColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}