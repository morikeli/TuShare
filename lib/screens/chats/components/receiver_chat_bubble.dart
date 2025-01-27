import 'package:flutter/material.dart';
import 'package:ride_share/utils/constants/colors.dart';


class ReceiverChatBubble extends StatelessWidget {
  const ReceiverChatBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * .04,
          maxWidth: MediaQuery.of(context).size.width * .42,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
          color: Theme.of(context).colorScheme.secondary,
        ),
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Text(
          'This is the incoming message chat bubble!',
          style: TextStyle(
            color: kTextLightColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
