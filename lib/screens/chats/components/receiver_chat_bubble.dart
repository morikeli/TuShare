import 'package:flutter/material.dart';
import 'package:ride_share/utils/constants/api_endpoints.dart';
import 'package:ride_share/utils/constants/colors.dart';


class ReceiverChatBubble extends StatelessWidget {
  const ReceiverChatBubble({
    super.key,
    required this.messageContent,
    required this.timestamp,
    required this.username,
    required this.userProfilePic,
  });

  final String messageContent, timestamp, username, userProfilePic;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          chatBubbleUserAvatar(),
          chatBubbleContainer(context),     // content - username, message content & timestamp
        ],
      ),
    );
  }

  Padding chatBubbleUserAvatar() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: CircleAvatar(
        radius: 12.0,
        backgroundImage: NetworkImage(
          '${ApiConstants.mediaURL}/$userProfilePic',
        ),
      ),
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
          topRight: Radius.circular(8.0),
        ),
        color: Theme.of(context).colorScheme.secondary,
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
            username,
            style: TextStyle(color: kTextSecondaryColor, fontSize: 12.0),
          ),
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
