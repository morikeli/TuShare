import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var isConnected = true.obs;       // Observable connection status

  @override
  void onInit() {
    super.onInit();
    checkConnectivity();      // Check initial connectivity status
    Connectivity().onConnectivityChanged.listen((status) {
      isConnected.value = !status.contains(ConnectivityResult.none);
      if (!isConnected.value) {
        showNoInternetDialog();
      }
    });
  }

  void checkConnectivity() async {
    var status = await Connectivity().checkConnectivity();
    isConnected.value = !status.contains(ConnectivityResult.none);
  }

  void showNoInternetDialog() {
    Get.defaultDialog(
      barrierDismissible: false,
      title: "No Internet!",
      middleText: "You are offline. Please check your connection.",
      textConfirm: "OK",
      onConfirm: () => Get.back(),
    );
  }
}
