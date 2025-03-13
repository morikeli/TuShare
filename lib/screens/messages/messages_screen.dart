import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/common/widgets/appbar.dart';
import 'package:ride_share/screens/messages/components/message_screen_body.dart';


class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sharedAppBar(context, 'Messages', LineIcons.comments),
      body: MessagesScreenBody(),
    );
  }
}
