import 'package:get/get.dart';
import 'package:ride_share/common/screens/homescreen.dart';
import 'package:ride_share/screens/chats/chat_screen.dart';
import 'package:ride_share/screens/login/login.dart';
import 'package:ride_share/screens/signup/signup.dart';
import 'package:ride_share/screens/slot/car_slot.dart';


List<GetPage<dynamic>> routes = [
  GetPage(name: '/login', page: () => LoginScreen()),
  GetPage(name: '/signup', page: () => SignupScreen()),
  GetPage(name: '/home', page: () => HomeScreen()),
  GetPage(name: '/car-slot', page: () => CarSlot()),
  GetPage(name: '/chat', page: () => ChatScreen()),
];