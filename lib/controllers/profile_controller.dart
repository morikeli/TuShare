import 'package:get/get.dart';
import 'package:ride_share/services/storage_service.dart';
import 'package:ride_share/utils/constants/api_endpoints.dart';


class ProfileController extends GetxController {
  final RxMap<String, String> userInfo = <String, String>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserInfo();
  }

  Future<void> loadUserInfo() async {
    final info = await StorageService.getUserInfo();

    if (info['profile_picture'] != null && info['profile_picture']!.isNotEmpty) {
      info['profile_picture'] = '${ApiConstants.baseURL}/${info['profile_picture']}';
    }
    
    userInfo.value = info;
  }
}
