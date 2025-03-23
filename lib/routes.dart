import 'package:get/get.dart';
import 'package:ride_share/common/screens/homescreen.dart';
import 'package:ride_share/screens/login/login_screen.dart';
import 'package:ride_share/screens/profile/edit_profile_screen.dart';
import 'package:ride_share/screens/signup/signup_screen.dart';


List<GetPage<dynamic>> routes = [
  GetPage(name: '/login', page: () => LoginScreen()),
  GetPage(name: '/signup', page: () => SignupScreen()),
  GetPage(name: '/home', page: () => HomeScreen()),
  GetPage(name: '/edit-profile', page: () => EditProfileScreen()),
];
