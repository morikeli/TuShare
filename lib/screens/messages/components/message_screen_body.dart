import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/controllers/message_controller.dart';
import 'package:ride_share/models/messages.dart';
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
      child: Obx(() {
        // if screen is loading, show a loading indicator
        if (messageController.isLoading.value) {
          return Center(
            child: SpinKitFadingCircle(
              color: kPrimaryColor,
              size: 68.0,
            ),
          );
        }

        if (messageController.currentUserMessages.isEmpty) {
          return ListView(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .4),
              Center(
                child: Column(
                  children: [
                    Icon(LineIcons.commentSlash, size: 48.0),
                    Text("You don't have any messages."),
                    ElevatedButton(
                      onPressed: messageController.fetchUserMessages,
                      child: Text('Refresh'),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return Scrollbar(
          child: messagesListViewBuilder(),
        );
      }),
    );
  }

  ListView messagesListViewBuilder() {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 72.0),
      itemCount: messageController.currentUserMessages.length,
      itemBuilder: (context, index) {
        final message = messageController.currentUserMessages[index];

        return GestureDetector(
          onTap: () {
            messageController.fetchGroupChats(message.rideID);    // fetch chats of the selected tile
            Get.to(
              () => ChatScreen(rideId: message.rideID, driverName: message.driverName, driverProfilePic: message.driverProfilePic,),
              duration: Duration(milliseconds: 1500),
              transition: Transition.downToUp,
            );
          },
          child: messageListTile(message, context),);
      },
    );
  }

  ListTile messageListTile(UserMessages message, BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            '${ApiConstants.mediaURL}/${message.driverProfilePic}',
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              message.driverName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              MessagesDateFormat.formatTimeinHoursAndMinutes(
                  message.latestTimeStamp,
              ),
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
  }
}
