import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/utils/constants/colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
        child: ListView(
          children: [
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/dps/6.jpg'),
                    radius: MediaQuery.of(context).size.width * .16,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton.filled(
                      onPressed: () {},
                      icon: Icon(LineIcons.camera, color: kIconLightColor),
                    ),
                  ),
                ],
              ),
            ),

            // edit profile form
            Form(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 1. username
                  Row(
                    children: [
                      Icon(LineIcons.user),
                      SizedBox(width: 12.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2.0),
                            hintText: 'Username',
                            labelStyle: TextStyle(
                              fontSize: 13.0,
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                  // 2. mobile no.
                  Row(
                    children: [
                      Icon(LineIcons.mobilePhone),
                      SizedBox(width: 12.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2.0),
                            hintText: 'Mobile no.',
                            labelStyle: TextStyle(
                              fontSize: 13.0,
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  // 4. home address
                  Row(
                    children: [
                      Icon(LineIcons.home),
                      SizedBox(width: 12.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2.0),
                            hintText: 'Home address',
                            labelStyle: TextStyle(
                              fontSize: 13.0,
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                  // 5. work address
                  Row(
                    children: [
                      Icon(LineIcons.building),
                      SizedBox(width: 12.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2.0),
                            hintText: 'Work address',
                            labelStyle: TextStyle(
                              fontSize: 13.0,
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  // 6. facebook handle
                  Row(
                    children: [
                      Icon(LineIcons.facebook),
                      SizedBox(width: 12.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2.0),
                            hintText: 'Facebook handle',
                            labelStyle: TextStyle(
                              fontSize: 13.0,
                            )
                          ),
                        ),
                      ),
                    ],
                  ),

                  // 7. instagram handle
                  Row(
                    children: [
                      Icon(LineIcons.instagram),
                      SizedBox(width: 12.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2.0),
                            hintText: 'Instagram handle',
                            labelStyle: TextStyle(
                              fontSize: 13.0,
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  // 8. X(formerly twitter) handle
                  Row(
                    children: [
                      Icon(LineIcons.twitter),
                      SizedBox(width: 12.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2.0),
                            hintText: 'X (formely Twitter) handle',
                            labelStyle: TextStyle(
                              fontSize: 13.0,
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 16.0,),
                  // Bio
                  Row(
                    children: [
                      Icon(LineIcons.user),
                      SizedBox(width: 12.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        child: TextField(
                          // expands: true,
                          maxLines: 2,
                          // minLines: null,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2.0),
                            hintText: 'Bio',
                            labelStyle: TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
