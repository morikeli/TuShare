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
      SnackbarUtils.showSnackbar(title: 'Oh snap! ', message: "Invalid credentials!", contentType: ContentType.failure);
      return Future.error('user ID not found!');
    }

    final response = await get('$url/$userID/messages');

    if (response.status.hasError) {
      final Map<String, dynamic> responseBody = json.decode(response.body);

      // add error message in responseMessage and show it in a snackbar.
      SnackbarUtils.showSnackbar(title: 'Oh snap! ', message: "${responseBody['detail']}", contentType: ContentType.failure);
      return Future.error(Exception(responseBody['detail']));
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
      SnackbarUtils.showSnackbar(title: 'Oh snap! ', message: "${responseBody['detail']}", contentType: ContentType.failure);
      return Future.error(Exception(responseBody['detail']));

    } else {
      return (response.body as List).map((messg) => ChatData.fromJson(messg)).toList();
    }
  }

  Future<bool> postMessage(rideID, messageContent) async {
    String? userID = await JwtDecoder.extractUserID();  // Get user ID from token

    final response = await post(ApiConstants.sendMessage, {
      'sender_id': userID,
      'ride_id': rideID,
      'content': messageContent
    });

    if (response.status.hasError) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      // add error message in responseMessage and show it in a snackbar.
      SnackbarUtils.showSnackbar(title: 'Oh snap! ', message: "${responseBody['detail']}", contentType: ContentType.failure);
      return Future.error(Exception(responseBody['detail']));
    } else {
      return !response.status.hasError;
    }

  }
}
