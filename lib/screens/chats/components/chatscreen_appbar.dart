import 'package:flutter/material.dart';
import 'package:ride_share/utils/constants/colors.dart';


AppBar chatScreenAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          CircleAvatar(
            radius: 16.0,
            backgroundImage: AssetImage('assets/images/dps/9.jpg'),
          ),
          SizedBox(width: 8.0),
          Text(
            'Brenda jones',
            style: TextStyle(
              color: kTextLightColor,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        
      ],
    );
  }