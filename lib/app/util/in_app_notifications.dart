import 'package:flutter/material.dart';
import 'package:fresshi/app/util/color_palette.dart';
import 'package:get/get.dart';

class NotificationBuilder {
  NotificationBuilder();

  void showErrorSnackbar(String title, String body) {
    Get.snackbar(
      title,
      body,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

  void showSuccessSnackbar(String title, String body) {
    Get.snackbar(
      title,
      body,
      backgroundColor: ColorPalette.primaryColor,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }
}
