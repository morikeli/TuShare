import 'package:flutter/material.dart';


class IconBadge extends StatelessWidget {
  const IconBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 2,
      child: Icon(
        Icons.circle,
        color: Colors.red,
        size: 12.0,
      ),
    );
  }
}
