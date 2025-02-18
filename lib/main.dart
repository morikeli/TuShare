import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:ride_share/common/screens/homescreen.dart';
import 'package:ride_share/routes.dart';
import 'package:ride_share/theme/theme.dart';


void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const GoRideApp());
  
  // whenever your initialization is completed, remove the splash screen:
  FlutterNativeSplash.remove();
}

class GoRideApp extends StatelessWidget {
  const GoRideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: routes,
      theme: GoRideAppTheme.lightTheme,
      darkTheme: GoRideAppTheme.darkTheme,
      home: HomeScreen(),
      initialRoute: '/login',
    );
  }
}
