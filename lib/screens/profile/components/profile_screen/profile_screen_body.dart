import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/screens/profile/components/profile_screen/chat_and_call_container.dart';
import 'package:ride_share/screens/profile/components/profile_screen/embedded_icons.dart';
import 'package:ride_share/screens/profile/components/profile_screen/username_and_rating.dart';
import 'package:ride_share/utils/constants/colors.dart';


class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // profile screen header
        userProfileScreenHeader(context),
        SizedBox(height: 24.0),
        // Profile info.
        userProfileInfo(context)
      ],
    );
  }

  Widget userProfileScreenHeader(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // 1. User profile picture
        Image.asset(
          'assets/images/dps/6.jpg',
          height: 280.0,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        DecoratedBox(decoration: BoxDecoration(color: Colors.black38)),
        // 2. Favorite and more options icons
        EmbeddedIcons(),
        // 3. Username and rating section
        UsernameAndRatingWidget(),
        // 4. Container with "Chat" & "Call" buttons
        ChatAndCallContainer(),
      ],
    );
  }

  Widget userProfileInfo(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(LineIcons.mobilePhone),
          title: Text('+254 112 345678', style: Theme.of(context).textTheme.bodyMedium),
          subtitle: Text('Mobile number', style: TextStyle(color: kTextSecondaryColor)),
        ),
        ListTile(
          leading: Icon(LineIcons.home),
          title: Text('000-0000', style: Theme.of(context).textTheme.bodyMedium),
          subtitle: Text('Home address', style: TextStyle(color: kTextSecondaryColor)),
        ),
        ListTile(
          leading: Icon(LineIcons.buildingAlt),
          title: Text('000-0000', style: Theme.of(context).textTheme.bodyMedium),
          subtitle: Text('Work address', style: TextStyle(color: kTextSecondaryColor)),
        ),
        ListTile(
          leading: Icon(LineIcons.facebook),
          title: Text('kelvin anderson', style: Theme.of(context).textTheme.bodyMedium),
          subtitle: Text('Facebook handle', style: TextStyle(color: kTextSecondaryColor)),
        ),
        ListTile(
          leading: Icon(LineIcons.instagram),
          title: Text('k_anderson', style: Theme.of(context).textTheme.bodyMedium),
          subtitle: Text('Instagram handle', style: TextStyle(color: kTextSecondaryColor)),
        ),
        ListTile(
          leading: Icon(LineIcons.twitter),
          title: Text('k.anderson', style: Theme.of(context).textTheme.bodyMedium),
          subtitle: Text('X (formerly Twitter) handle', style: TextStyle(color: kTextSecondaryColor)),
        ),
        SizedBox(height: 12.0),
        ListTile(
          title: Row(
            children: [
              Text('About me'),
              Spacer(),
              Text(
                'Member since Dec 2024',
                style: TextStyle(color: kTextSecondaryColor, fontSize: 12.0),
              ),
            ],
          ),
          subtitle: Text(
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt, repellendus eaque provident soluta quibusdam quae. Earum autem molestias repellendus harum distinctio voluptatum architecto impedit commodi reiciendis. Ab hic quae vitae.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(height: 60.0), // add space after the last widget in the column
      ],
    );
  }
}
