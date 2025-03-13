import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/controllers/message_controller.dart';
import 'package:ride_share/screens/chats/chat_screen.dart';
import 'package:ride_share/screens/messages/utils/format_date.dart';
import 'package:ride_share/utils/constants/api_endpoints.dart';
import 'package:ride_share/utils/constants/colors.dart';


class MessagesScreenBody extends StatelessWidget {
  MessagesScreenBody({
    super.key,
  });

  final MessagesController messageController = Get.put(MessagesController());


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async => await messageController.fetchUserMessages(),
      child: Scrollbar(
        child: groupMessages(),
      ),
    );
  }

  GestureDetector groupMessages() {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ChatScreen(),
          duration: Duration(milliseconds: 1500),
          transition: Transition.downToUp,
        );
      },
      child: groupMessagesTiles(),
    );
  }

  ListView groupMessagesTiles() {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 72.0),
      itemCount: messageController.currentUserMessages.length,
      itemBuilder: (context, index) {
        final message = messageController.currentUserMessages[index];

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('${ApiConstants.mediaURL}/${message.driverProfilePic}'),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                message.driverName,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                MessagesDateFormat.formatTimeinHoursAndMinutes(message.latestTimeStamp),
                style: TextStyle(color: kTextSecondaryColor, fontSize: 12.0),
              ),
            ],
          ),
          subtitle: Text(
            message.latestMessage,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        );
      },
    );
  }
}
