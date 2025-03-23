import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';


class SnackbarUtils {
  static void showSnackbar({
    required String title,
    required String message,
    required ContentType contentType,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 7),
        messageText: SizedBox(
          height: 108.0,
          child: AwesomeSnackbarContent(
            title: title,
            message: message,
            messageTextStyle: const TextStyle(fontSize: 14.0, overflow: TextOverflow.visible),
            contentType: contentType,
          ),
        ),
      ),
    );
  }
}
