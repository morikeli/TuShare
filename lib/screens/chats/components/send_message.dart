import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/controllers/message_controller.dart';

class SendMessageWidget extends StatelessWidget {
  SendMessageWidget({
    super.key,
    required this.rideId,
  });

  final String rideId;
  final MessagesController messagesController = Get.put(MessagesController());
  final TextEditingController messageContentEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: textInputField(context),
          ),
        )
      ],
    );
  }

  TextFormField textInputField(BuildContext context) {
    return TextFormField(
      controller: messageContentEditingController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        filled: true,
        hintText: 'Message ...',
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        suffixIcon: IconButton(
          tooltip: 'Send message',
          onPressed: () {
            messagesController.sendMessage(rideId, messageContentEditingController.text);
            messageContentEditingController.clear();    // clear the input field after sending message
          },
          icon: Icon(LineIcons.arrowCircleUp),
        ),
      ),
    );
  }
}
