import 'package:get/get.dart';
import 'package:ride_share/models/messages.dart';
import 'package:ride_share/services/messages_service.dart';


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
    isLoading(true);
    bool success = await _messagesService.postMessage(rideId, messageContent);
    if (success) {
      fetchGroupChats(rideId);    // fetch newly sent message
      update();   // update UI
    } else {
      Get.snackbar("Error", "Couldn't send your message.");
    }
    isLoading(false);
  }
}
