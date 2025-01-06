import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/utils/constants/colors.dart';

class EmbeddedIcons extends StatelessWidget {
  const EmbeddedIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              LineIcons.horizontalEllipsis,
              color: kIconLightColor,
            ),
          )
        ],
      ),
    );
  }
}