import 'package:get/get.dart';
import 'package:ride_share/common/screens/homescreen.dart';
import 'package:ride_share/screens/chats/chat_screen.dart';
import 'package:ride_share/screens/slot/car_slot.dart';


List<GetPage<dynamic>> routes = [
  GetPage(name: '/home', page: () => HomeScreen()),
  GetPage(name: '/car-slot', page: () => CarSlot()),
  GetPage(name: '/chat', page: () => ChatScreen()),
];