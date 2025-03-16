import 'package:flutter/material.dart';
import 'package:ride_share/utils/constants/colors.dart';

class SenderChatBubble extends StatelessWidget {
  const SenderChatBubble({
    super.key,
    required this.messageContent,
    required this.timestamp,
  });

  final String messageContent, timestamp;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: chatBubbleContainer(context),
    );
  }

  Container chatBubbleContainer(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * .68,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
          topLeft: Radius.circular(8.0),
        ),
        color: kPrimaryColor,
      ),
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: chatBubbleContent(),
    );
  }

  IntrinsicWidth chatBubbleContent() {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            messageContent,
            style: TextStyle(
              color: kTextLightColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                timestamp,
                style: TextStyle(color: kTextSecondaryColor, fontSize: 12.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
