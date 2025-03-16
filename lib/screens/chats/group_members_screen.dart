import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share/controllers/message_controller.dart';
import 'package:ride_share/models/messages.dart';
import 'package:ride_share/utils/constants/api_endpoints.dart';
import 'package:ride_share/utils/constants/colors.dart';

class GroupMembersScreen extends StatelessWidget {
  GroupMembersScreen({
    super.key,
    required this.driverName,
    required this.driverProfilePic,
  });

  final String driverName, driverProfilePic;
  final MessagesController messagesController = Get.put(MessagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$driverName's ride")),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
        children: [
          // driver info
          driverInfo(context),
          SizedBox(height: 20.0),
          Divider(color: kSecondaryColor),
          SizedBox(height: 20.0),
          // group members
          // 1. Text() to display title of this section
          Text('Group members (passengers)'),
          SizedBox(height: 16.0),
          // 2. driver's list tile
          groupMembersDriverListTile(context),
          // 3. Use Column to group all passengers ListTile() widgets
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                // passengers - iterate a list of and show all passengers using .map()
                messagesController.groupChats
                    .expand((groupData) => groupData.groupMembers)
                    .map((member) {
              return groupMembersListTile(member, context);
            }).toList(),
          )
        ],
      ),
    );
  }

  Column driverInfo(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              '${ApiConstants.mediaURL}/$driverProfilePic',
            ),
            radius: MediaQuery.of(context).size.width * .16,
          ),
        ),
        SizedBox(height: 12.0),
        Text(driverName, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }

  ListTile groupMembersDriverListTile(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          '${ApiConstants.mediaURL}/$driverProfilePic',
        ),
        radius: 20,
      ),
      title: Text(
        driverName,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Container(
        height: 15.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.blue.shade900,
          shape: BoxShape.rectangle,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 6.0,
          vertical: 1.0,
        ),
        child: Text(
          'Driver',
          style: TextStyle(color: kTextLightColor, fontSize: 9.0),
        ),
      ),
    );
  }

  ListTile groupMembersListTile(User member, BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          '${ApiConstants.mediaURL}/${member.profileImage}',
        ),
        radius: 20,
      ),
      title: Text(
        '${member.firstName} ${member.lastName}',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
