import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/utils/constants/colors.dart';


class UsernameAndRatingWidget extends StatelessWidget {
  const UsernameAndRatingWidget({
    super.key,
  });

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
              'Kelvin Anderson',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Row(
              children: [
                Icon(LineIcons.starAlt, color: Colors.yellow),
                Icon(LineIcons.starAlt, color: Colors.yellow),
                Icon(LineIcons.starHalf, color: Colors.yellow),
                Icon(LineIcons.star, color: kIconLightColor),
                Icon(LineIcons.star, color: kIconLightColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}