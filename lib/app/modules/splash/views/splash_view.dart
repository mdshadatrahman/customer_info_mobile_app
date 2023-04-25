import 'package:customer_info/uitls/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Obx(
          () => controller.isLoading.value
              ? const CircularProgressIndicator(
                  color: AppColors.white,
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
