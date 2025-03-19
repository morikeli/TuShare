import 'package:get/get.dart';
import '../controllers/network_controller.dart'; // Import NetworkController

class NetworkUtils {
  static bool checkInternet() {
    if (!Get.find<NetworkController>().isConnected.value) {
      Get.snackbar("No Internet", "Check your connection before proceeding.");
      return false; // No internet connection
    }
    return true; // Connected
  }
}
