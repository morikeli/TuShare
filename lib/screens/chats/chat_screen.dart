import 'package:flutter/material.dart';
import 'package:ride_share/screens/chats/components/chatscreen_appbar.dart';
import 'package:ride_share/screens/chats/components/receiver_chat_bubble.dart';
import 'package:ride_share/screens/chats/components/send_message.dart';
import 'package:ride_share/screens/chats/components/sender_chat_bubble.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatScreenAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          children: [
            // chat bubbles
            SenderChatBubble(),  // sender chat bubble
            ReceiverChatBubble(),  // receiver chat bubble

            Spacer(), // push textform field to the bottom of the screen - end of column
            // text input - send message
            SendMessageWidget()
          ],
        ),
      ),
    );
  }
}
