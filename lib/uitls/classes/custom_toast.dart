import 'package:customer_info/uitls/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomToast {
  static void show(
    String title,
    String message,
    bool isError,
  ) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: isError ? const Color.fromARGB(255, 125, 33, 26) : AppColors.primaryColor,
      colorText: isError ? Colors.white : AppColors.white,
      margin: const EdgeInsets.all(20),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
    );
  }
}
