import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share/controllers/message_controller.dart';
import 'package:ride_share/screens/chats/components/chatscreen_appbar.dart';
import 'package:ride_share/screens/chats/components/chatscreen_body.dart';


class ChatScreen extends StatelessWidget {
  ChatScreen({
    super.key,
    required this.driverName,
    required this.driverProfilePic,
    required this.rideId
  });

  final String driverName, driverProfilePic, rideId;
  final MessagesController messagesController = Get.put(MessagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatScreenAppBar(context, driverName, driverProfilePic),
      body: ChatScreenBody(rideId: rideId),
    );
  }
}
