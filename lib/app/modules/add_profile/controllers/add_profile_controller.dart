import 'dart:developer';

import 'package:customer_info/app/data/district_model.dart';
import 'package:customer_info/app/data/division_model.dart';
import 'package:customer_info/app/data/upazila_model.dart';
import 'package:customer_info/app/geo/get_geo.dart';
import 'package:customer_info/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:developer' as developer show log;
import 'package:http/http.dart' as http;

class AddProfileController extends GetxController {
  final homeController = Get.find<HomeController>();

  Rx<TextEditingController> storeNameController = TextEditingController().obs;
  Rx<TextEditingController> ownerNameController = TextEditingController().obs;
  Rx<TextEditingController> mobileNumberController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> countryController = TextEditingController().obs;
  Rx<TextEditingController> websiteController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> aboutStoreController = TextEditingController().obs;

  RxList<Division> divisions = <Division>[].obs;
  Rx<Division> selectedDivision = Division().obs;

  RxList<District> districts = <District>[].obs;
  Rx<District> selectedDistrict = District().obs;

  RxList<Upazila> upazilas = <Upazila>[].obs;
  Rx<Upazila> selectedUpazila = Upazila().obs;

  @override
  void onInit() {
    getDivision();
    super.onInit();
  }

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

  void getDivision() async {
    final response = await GetGeo.getDivisions();
    response.forEach((element) {
      divisions.add(Division.fromJson(element));
    });
    selectedDivision.value = divisions[3];
    getDistrict(4);
  }

  void getDistrict(int divisionId) async {
    districts.clear();
    final response = await GetGeo.getDistricts(divisionId);
    response['data']['district'].forEach((element) {
      districts.add(District.fromJson(element));
    });
    selectedDistrict.value = districts[0];
    getUpazila(selectedDistrict.value.id!);
  }

  void getUpazila(int districtId) async {
    upazilas.clear();
    final response = await GetGeo.getUpazilas(districtId);
    response['data']['upazila'].forEach((element) {
      upazilas.add(Upazila.fromJson(element));
    });
    selectedUpazila.value = upazilas.first;
  }
}
