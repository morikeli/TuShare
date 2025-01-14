import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/common/widgets/appbar.dart';
import 'package:ride_share/screens/chats/chat_screen.dart';
import 'package:ride_share/utils/constants/colors.dart';


class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sharedAppBar(context, 'Messages', LineIcons.comments),
      body: Scrollbar(
        child: GestureDetector(
          onTap: () {
            Get.to(
              () => ChatScreen(),
              duration: Duration(milliseconds: 1500),
              transition: Transition.downToUp,
            );
          },
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 72.0),
            itemCount: 15,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/dps/9.jpg'),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Brenda jones',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      '4 Jan 25',
                      style: TextStyle(color: kTextSecondaryColor, fontSize: 12.0),
                    ),
                  ],
                ),
                subtitle: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt, repellendus eaque provident soluta quibusdam quae. Earum autem molestias repellendus harum distinctio voluptatum architecto impedit commodi reiciendis. Ab hic quae vitae.',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
