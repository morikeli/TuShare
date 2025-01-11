import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/common/widgets/icon_badge.dart';


AppBar sharedAppBar(BuildContext context, String title, IconData? titleIcon) {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(titleIcon),
          SizedBox(width: 5.0),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
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