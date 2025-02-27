import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomSnackbar extends StatelessWidget {
  const CustomSnackbar({
    super.key,
    required this.snackbarMessage,
  });

  final RxMap<String, dynamic> snackbarMessage;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (snackbarMessage.isNotEmpty) {
          /* 
          Unhandled Exception: visitChildElements() called during build. 
          
          The error mentioned above occurs when you're trying to perform actions involving child widgets
          (like showing a Snackbar) during the build process. This is not allowed because the widget tree
          is still being updated and children are not yet ready to be interacted with.
                
          To counter this, post-frame callback is used to display the Snackbar() after the entire widget tree is built.
        */
          // Use post-frame callback to show snackbar after the frame is built
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.closeAllSnackbars();    // close all snackbars before displaying a new one
            Get.showSnackbar(
              GetSnackBar(
                backgroundColor: Colors.transparent,
                duration: Duration(seconds: 7),
                messageText: SizedBox(
                  height: 108.0,
                  child: AwesomeSnackbarContent(
                    title: snackbarMessage["title"],
                    message: snackbarMessage["message"],
                    messageTextStyle: TextStyle(fontSize: 14.0, overflow: TextOverflow.visible),
                    contentType: snackbarMessage["type"],
                  ),
                ),
              ),
            );
          });
        } else {
          Get.closeCurrentSnackbar();
        }
        
        return SizedBox.shrink();
      },
    );
  }
}
