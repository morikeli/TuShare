import 'package:get/get.dart';
import 'package:ride_share/models/messages.dart';
import 'package:ride_share/services/messages_service.dart';
import 'package:ride_share/utils/network_util.dart';


class MessagesController extends GetxController {
  var isLoading = false.obs;
  var currentUserMessages = <UserMessages>[].obs;
  var groupChats = <ChatData>[].obs;
  final MessagesService _messagesService = MessagesService();

  @override
  void onInit() {
    fetchUserMessages();
    super.onInit();
  }


  // method for retrieving group messages - shown in the message screen
  Future<void> fetchUserMessages() async {
    // check connectivity before making a request
    if (!NetworkUtils.checkInternet()) return;       // Stop if there's no connectivity

    isLoading(true);
    try {
      var userMessages = await _messagesService.getUserMessages();
      currentUserMessages.assignAll(userMessages);
      update();     // update UI
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading(false);
    }
  }

  // method for retrieving all group chats
  Future<void> fetchGroupChats(String rideID) async {
    // check connectivity before making a request
    if (!NetworkUtils.checkInternet()) return;       // Stop if there's no connectivity

    isLoading(true);
   try {
      var groupChatData = await _messagesService.getGroupChats(rideID);
      groupChats.assignAll(groupChatData);
      update();     // update UI
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading(false);
    }
  }

  // method for sending group messages
  Future<void> sendMessage(String rideId, String messageContent) async {
    // check connectivity before making a request
    if (!NetworkUtils.checkInternet()) return;       // Stop if there's no connectivity

    isLoading(true);
    bool success = await _messagesService.postMessage(rideId, messageContent);
    if (success) {
      await fetchGroupChats(rideId);    // retrieve recently sent message
      fetchUserMessages();             // refresh messages on message screen
      update();   // update UI
    } else {
      Get.snackbar("Error", "Couldn't send your message.");
    }
    isLoading(false);
  }
}
