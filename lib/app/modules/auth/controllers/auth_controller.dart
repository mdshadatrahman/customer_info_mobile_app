import 'dart:developer' as developer show log;

import 'package:customer_info/app/data/user_model.dart';
import 'package:customer_info/app/routes/app_pages.dart';
import 'package:customer_info/uitls/api_client.dart';
import 'package:customer_info/uitls/shared_prefs_service.dart';
import 'package:customer_info/uitls/url.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<User> user = User().obs;
  RxBool isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;

    final response = await ApiClient.instance.post(
      url: URL.login,
      body: {
        'phone': phoneController.value.text,
        'password': passwordController.value.text,
      },
    );

    if (response != null) {
      SharedPreferenceService.setToken(response['user']['token']);
      final test = await ApiClient.instance.get(url: URL.currentUser);
      user.value = User.fromJson(test);
      if (user.value.user?.power == 1) {
        Get.offAllNamed(Routes.HOME);
      } else if (user.value.user?.power == 2) {
        Get.offAllNamed(Routes.ADD_PROFILE);
      } else {
        Fluttertoast.showToast(msg: 'Unknown user');
      }
      isLoading.value = false;
    } else {
      Fluttertoast.showToast(msg: 'Login failed');
    }

    isLoading.value = false;
  }

  Future<void> register() async {
    isLoading.value = true;

    final response = await ApiClient.instance.post(
      url: URL.register,
      body: {
        'name': nameController.value.text,
        'phone': phoneController.value.text,
        'password': passwordController.value.text,
        'power': 2, // Two means employee, 1 means admin
      },
    );
    if (response != null) {
      SharedPreferenceService.setToken(response['user']['token']);
      final test = await ApiClient.instance.get(url: URL.currentUser);
      user.value = User.fromJson(test);
      if (user.value.user?.power == 1) {
        Get.offAllNamed(Routes.HOME);
      } else if (user.value.user?.power == 2) {
        Get.offAllNamed(Routes.ADD_PROFILE);
      } else {
        Fluttertoast.showToast(msg: 'Unknown user');
      }
      isLoading.value = false;
    } else {
      Fluttertoast.showToast(msg: 'Login failed');
    }

    isLoading.value = false;
  }
}
