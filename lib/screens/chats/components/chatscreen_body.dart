import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ride_share/controllers/message_controller.dart';
import 'package:ride_share/models/messages.dart';
import 'package:ride_share/screens/chats/components/receiver_chat_bubble.dart';
import 'package:ride_share/screens/chats/components/send_message.dart';
import 'package:ride_share/screens/chats/components/sender_chat_bubble.dart';
import 'package:ride_share/screens/chats/utils/get_user_id.dart';
import 'package:ride_share/screens/messages/utils/format_date.dart';
import 'package:ride_share/utils/constants/colors.dart';


class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody({
    super.key,
    required this.rideId,
  });

  final String rideId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. chat bubbles and date banners
        Expanded(
          child: GetBuilder<MessagesController>(
            builder: (messagesController) {
              return chatScreenFutureBuilderWidget(messagesController);
            },
          ),
        ),

        // 2. text field and send button
        SendMessageWidget(rideId: rideId),
      ],
    );
  }

  FutureBuilder<String?> chatScreenFutureBuilderWidget(MessagesController messagesController) {
    return FutureBuilder<String?>(
      future: GetUserId.currentUserID(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: SpinKitThreeInOut(color: kPrimaryColor, size: 68.0));
        }

        String? userId = snapshot.data;
        List<Message> allMessages = messagesController.groupChats
            .expand((chatData) => chatData.messages)
            .toList();

        allMessages.sort((a, b) => a.timestamp.compareTo(b.timestamp));

        String? lastDisplayedDate;

        return chatBubblesListView(allMessages, lastDisplayedDate, userId);
      },
    );
  }

  ListView chatBubblesListView(List<Message> allMessages, String? lastDisplayedDate, String? userId) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      itemCount: allMessages.length,
      itemBuilder: (context, index) {
        final msg = allMessages[index];

        // Convert timestamp to readable format
        String messageDate = MessagesDateFormat.getFormattedDate(msg.timestamp);

        // Display the date banner only if it's different from the last displayed one
        bool showDateBanner = lastDisplayedDate != messageDate;
        lastDisplayedDate = messageDate;

        return chatBubblesAndDateBanner(
          showDateBanner,
          messageDate,
          userId,
          msg,
        );
      },
    );
  }

  Column chatBubblesAndDateBanner(bool showDateBanner, String messageDate, String? userId, Message msg) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showDateBanner)
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                messageDate,
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
            ),
          ),
        userId == msg.sender.id
            ? SenderChatBubble(
                messageContent: msg.content,
                timestamp: MessagesDateFormat.chatBubbleTimeFormat(msg.timestamp.toString()),
              )
            : ReceiverChatBubble(
                messageContent: msg.content,
                timestamp: MessagesDateFormat.chatBubbleTimeFormat(msg.timestamp.toString()),
                username: '${msg.sender.firstName} ${msg.sender.lastName}',
                userProfilePic: msg.sender.profileImage,
              ),
      ],
    );
  }
}
