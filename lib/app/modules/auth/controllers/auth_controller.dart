import 'dart:convert';
import 'dart:developer';

import 'package:customer_info/app/data/user_model.dart';
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
      await ApiClient.instance.get(url: URL.currentUser);
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
        'power': 2,
      },
    );
    if (response != null) {
      SharedPreferenceService.setToken(response['user']['token']);
    } else {
      Fluttertoast.showToast(msg: 'Registration failed');
    }

    isLoading.value = false;
  }
}
