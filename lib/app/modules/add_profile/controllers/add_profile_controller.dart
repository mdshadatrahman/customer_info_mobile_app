import 'dart:developer';

import 'package:customer_info/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class AddProfileController extends GetxController {
  final homeController = Get.find<HomeController>();

  Rx<TextEditingController> storeNameController = TextEditingController().obs;
  Rx<TextEditingController> ownerNameController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> countryController = TextEditingController().obs;
  Rx<TextEditingController> divisionController = TextEditingController().obs;
  Rx<TextEditingController> districtController = TextEditingController().obs;
  Rx<TextEditingController> thanaController = TextEditingController().obs;
  Rx<TextEditingController> websiteController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> aboutStoreController = TextEditingController().obs;

  createStore() async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3001/store'),
      body: {
        'store_name': storeNameController.value.text,
        'owner_name': ownerNameController.value.text,
        'category': homeController.selectedCategory.value.id.toString(),
        'phone': mobileNumberController.value.text,
        'country': 'BD',
        'division': 'Dhaka',
        'district': 'Dhaka',
        'thana': 'Dhaka',
      },
    );

    log(response.body);
    // final response = await ApiClient().request(Request.POST, 'store', data: {
    //   'store_name': storeNameController.value.text,
    //   'owner_name': ownerNameController.value.text,
    //   'category': homeController.selectedCategory.value.id,
    //   'phone': mobileNumberController.value.text,
    // 'informal_address': addressController.value.text,
    // 'country': countryController.value.text,
    // 'division': divisionController.value.text,
    // 'district': districtController.value.text,
    // 'thana': thanaController.value.text,
    // 'website': websiteController.value.text,
    // 'email': emailController.value.text,
    // 'about': aboutStoreController.value.text,
    // });
  }
}
