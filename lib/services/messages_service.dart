import 'dart:convert';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:get/get.dart';
import 'package:ride_share/common/widgets/custom_snackbar.dart';
import 'package:ride_share/models/messages.dart';
import 'package:ride_share/utils/constants/api_endpoints.dart';
import 'package:ride_share/utils/jwt_decoder.dart';


class MessagesService extends GetConnect {
  final String url = ApiConstants.getUserMessages;

  @override
  void onInit() {
    httpClient.baseUrl = url;
    httpClient.timeout = const Duration(minutes: 3);
    super.onInit();
  }


  // retrieve group messages
  Future<List<UserMessages>> getUserMessages() async {
    String? userID = await JwtDecoder.extractUserID();  // Get user ID from token

    // if userID does not exist, return an error message.
    if (userID == null) {
      final RxMap<String, dynamic> responseMessage = {"title": "Error!","message": "User credentials not found.","type": ContentType.failure}.obs;
      return Future.error(CustomSnackbar(snackbarMessage: responseMessage));
    }

    final response = await get('$url/$userID/messages');

    if (response.status.hasError) {
      final Map<String, dynamic> responseBody = json.decode(response.body);

      // add error message in responseMessage and show it in a snackbar.
      final RxMap<String, dynamic> responseMessage = {"title": "Error", "message": "${responseBody['detail']}", "type": ContentType.failure}.obs;
      return Future.error(CustomSnackbar(snackbarMessage: responseMessage));
    } else {
      return (response.body as List).map((msg) => UserMessages.fromJson(msg)).toList();
    }

  }

  // retrieve group chats of the selected group - selected in messages screen
  Future<List<ChatData>> getGroupChats(String rideID) async {
    final response  = await get('$url/$rideID/get');
    
    if (response.status.hasError) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      // add error message in responseMessage and show it in a snackbar.
      final RxMap<String, dynamic> responseMessage = {"title": "Error", "message": "${responseBody['detail']}", "type": ContentType.failure}.obs;
      return Future.error(CustomSnackbar(snackbarMessage: responseMessage));
    } else {
      return (response.body as List).map((messg) => ChatData.fromJson(messg)).toList();
    }
  }
}
