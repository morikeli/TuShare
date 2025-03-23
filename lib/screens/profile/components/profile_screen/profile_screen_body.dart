import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/controllers/profile_controller.dart';
import 'package:ride_share/models/user_profile.dart';
import 'package:ride_share/screens/profile/components/profile_screen/chat_and_call_container.dart';
import 'package:ride_share/screens/profile/components/profile_screen/embedded_icons.dart';
import 'package:ride_share/screens/profile/components/profile_screen/username_and_rating.dart';
import 'package:ride_share/utils/constants/api_endpoints.dart';
import 'package:ride_share/utils/constants/colors.dart';

class ProfileScreenBody extends StatelessWidget {
  ProfileScreenBody({
    super.key,
  });

  final ProfileController profileController = Get.put(ProfileController());

  String formatMonthYear(String dateString) {
    DateTime parsedDate = DateTime.parse(dateString);
    String year = DateFormat('MMM yyyy').format(parsedDate);
    return year;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileController.isLoading.value) {
        return Center(
          child: SpinKitFadingCircle(color: kPrimaryColor, size: 68.0),
        );
      }
      final profile = profileController.userProfile.value;

      if (profile == null) {
        return ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .4),
            Center(
              child: Column(
                children: [
                  Icon(LineIcons.userSlash, size: 48.0),
                  Text('No profile data available.'),
                  ElevatedButton(
                    onPressed: profileController.fetchuserProfile,
                    child: Text('Refresh'),
                  ),
                ],
              ),
            ),
          ],
        );
      }

      return RefreshIndicator.adaptive(
        onRefresh: () async {
          await profileController.fetchuserProfile();
        },
        child: ListView(
          children: [
            // profile screen header
            userProfileScreenHeader(context, profile),
            SizedBox(height: 24.0),
            // Profile info.
            userProfileInfo(context, profile),
          ],
        ),
      );
    });
  }

  Widget userProfileScreenHeader(BuildContext context, UserProfile profile) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // 1. User profile picture
        Opacity(
          opacity: Get.isDarkMode ? .5 : .84,     // set opacity to 0.5 if the app's theme is dark mode otherwise set it to 0.84
          child: Image.network(
            '${ApiConstants.mediaURL}/${profile.profilePicture}',
            height: 280.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        DecoratedBox(decoration: BoxDecoration(color: Colors.black38)),
        // 2. Favorite and more options icons
        EmbeddedIcons(),
        // 3. Username and rating section
        UsernameAndRatingWidget(
          firstName: profile.firstName,
          lastName: profile.lastName,
        ),
        // 4. Container with "Chat" & "Call" buttons
        ChatAndCallContainer(),
      ],
    );
  }

  Widget userProfileInfo(BuildContext context, UserProfile profile) {
    return Column(
      children: [
        ListTile(
          leading: Icon(LineIcons.mobilePhone),
          title: Text(
            profile.mobileNumber.isEmpty ? '---' : profile.mobileNumber,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            'Mobile number',
            style: TextStyle(color: kTextSecondaryColor),
          ),
        ),
        ListTile(
          leading: Icon(LineIcons.home),
          title: Text(
            profile.homeAddress.isEmpty ? '---' : profile.homeAddress,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            'Home address',
            style: TextStyle(color: kTextSecondaryColor),
          ),
        ),
        ListTile(
          leading: Icon(LineIcons.buildingAlt),
          title: Text(
            profile.workAddress.isEmpty ? '---' : profile.workAddress,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            'Work address',
            style: TextStyle(color: kTextSecondaryColor),
          ),
        ),
        ListTile(
          leading: Icon(LineIcons.facebook),
          title: Text(
            profile.facebookHandle.isEmpty ? '---' : profile.facebookHandle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            'Facebook handle',
            style: TextStyle(color: kTextSecondaryColor),
          ),
        ),
        ListTile(
          leading: Icon(LineIcons.instagram),
          title: Text(
            profile.instagramHandle.isEmpty ? '---' : profile.instagramHandle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            'Instagram handle',
            style: TextStyle(color: kTextSecondaryColor),
          ),
        ),
        ListTile(
          leading: Icon(LineIcons.twitter),
          title: Text(
            profile.twitterHandle.isEmpty ? '---' : profile.twitterHandle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            'X (formerly Twitter) handle',
            style: TextStyle(color: kTextSecondaryColor),
          ),
        ),
        SizedBox(height: 12.0),
        ListTile(
          title: Row(
            children: [
              Text('About me'),
              Spacer(),
              Text(
                'Member since ${formatMonthYear(profile.dateJoined)}',
                style: TextStyle(color: kTextSecondaryColor, fontSize: 12.0),
              ),
            ],
          ),
          subtitle: Text(
            profile.bio.isEmpty ? '---' : profile.bio,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(height: 92.0), // add space after the last widget in the column
      ],
    );
  }
}
