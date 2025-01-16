import 'dart:math';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/utils/constants/colors.dart';

class RidesStats extends StatelessWidget {
  const RidesStats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.0),
        Row(
          children: [
            carImageTopView(), // image file
            statsSection(context) // widget that displays statistics
          ],
        )
      ],
    );
  }

  Column statsSection(BuildContext context) {
    return Column(
      children: [
        Text(
          'Average used capacity',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text.rich(
          TextSpan(
              text: '2',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 44.0,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: '/4',
                  style: TextStyle(
                    color: kTextSecondaryColor,
                    fontSize: 44.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
        ),
        Text(
          'Shared kilometres',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Row(
          children: [
            Icon(LineIcons.road),
            SizedBox(width: 8.0),
            Text(
              '72 km',
              style: TextStyle(
                color: kTextSecondaryColor,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column carImageTopView() {
    return Column(
      children: [
        SizedBox(
          height: 180.0,
          child: Transform.rotate(
            angle: pi / 2,
            child: Image.asset(
              'assets/icons/car-top.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
