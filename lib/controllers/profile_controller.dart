import 'dart:convert';
import 'package:get/get.dart';
import 'package:ride_share/models/user_profile.dart';
import 'package:ride_share/services/storage_service.dart';
import 'package:ride_share/utils/constants/api_endpoints.dart';
import 'package:http/http.dart' as http;


class ProfileController extends GetxController {
  final RxMap<String, String> userInfo = <String, String>{}.obs;
  var userProfile = Rxn<UserProfile>();
  var isLoading = true.obs;


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

  Future<void> fetchProfile() async {
    try {
      isLoading(true);
      final token = await StorageService.getUserInfo();
      final response = await http.get(
        Uri.parse(ApiConstants.userProfile),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        userProfile.value = UserProfile.fromJson(data);
      } else {
        Get.snackbar('Error', 'Failed to load profile');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isLoading(false);
    }
  }
}
