import 'package:customer_info/app/data/category_model.dart';
import 'package:customer_info/app/data/district_model.dart';
import 'package:customer_info/app/data/division_model.dart';
import 'package:customer_info/app/data/upazila_model.dart';
import 'package:customer_info/app/data/user_model.dart';
import 'package:customer_info/app/geo/get_geo.dart';
import 'package:customer_info/app/routes/app_pages.dart';
import 'package:customer_info/uitls/api_client.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:customer_info/uitls/shared_prefs_service.dart';
import 'package:customer_info/uitls/url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AddProfileController extends GetxController {
  Rx<CategoryModel> selectedCategory = CategoryModel().obs;
  RxList<CategoryModel> categoryModel = <CategoryModel>[].obs;
  Rx<User> user = User().obs;

  RxBool isLoading = false.obs;
  RxBool showBackButton = false.obs;

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
    getAllCategory();
    getDivision();
    setUser();
    super.onInit();
  }

  setDropdownList() {
    if (categoryModel.isNotEmpty) {
      selectedCategory.value = categoryModel.first;
    }
  }

  setUser() async {
    isLoading.value = true;
    final test = await ApiClient.instance.get(url: URL.currentUser);
    user.value = User.fromJson(test);
    if (user.value.user?.power == 1) {
      showBackButton.value = true;
    } else if (user.value.user?.power == 2) {
      showBackButton.value = false;
    } else {
      Fluttertoast.showToast(msg: 'Unknown user');
    }
    isLoading.value = false;
  }

  Future<void> getAllCategory() async {
    final response = await ApiClient().get(url: 'category');
    categoryModel.value = List<CategoryModel>.from(
      response.map(
        (x) => CategoryModel.fromJson(x),
      ),
    );
    setDropdownList();
  }

  createStore() async {
    isLoading.value = true;
    final response = await ApiClient.instance.post(
      url: 'store',
      body: {
        'store_name': storeNameController.value.text,
        'owner_name': ownerNameController.value.text,
        'category': selectedCategory.value.id,
        'phone': mobileNumberController.value.text,
        'informal_address': addressController.value.text,
        'country': 'Bangladesh',
        'divisionId': selectedDivision.value.id,
        'districtId': selectedDistrict.value.id,
        'upazilaId': selectedUpazila.value.id,
        'website': websiteController.value.text,
        'email': emailController.value.text,
        'about': aboutStoreController.value.text,
      },
    );

    if (response != null) {
      storeNameController.value.clear();
      ownerNameController.value.clear();
      mobileNumberController.value.clear();
      addressController.value.clear();
      countryController.value.clear();
      websiteController.value.clear();
      emailController.value.clear();
      aboutStoreController.value.clear();
      Get.back();
      Get.snackbar(
        'Success',
        'Store Created Successfully',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.white,
        margin: const EdgeInsets.all(10),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isLoading.value = false;
  }

  void getDivision() async {
    isLoading.value = true;
    final response = await GetGeo.getDivisions();
    response.forEach((element) {
      divisions.add(Division.fromJson(element));
    });
    selectedDivision.value = divisions[3];
    getDistrict(4);
    isLoading.value = false;
  }

  void getDistrict(int divisionId) async {
    isLoading.value = true;
    districts.clear();
    final response = await GetGeo.getDistricts(divisionId);
    response['data']['district'].forEach((element) {
      districts.add(District.fromJson(element));
    });
    selectedDistrict.value = districts[0];
    getUpazila(selectedDistrict.value.id!);
    isLoading.value = false;
  }

  void getUpazila(int districtId) async {
    isLoading.value = true;
    upazilas.clear();
    final response = await GetGeo.getUpazilas(districtId);
    response['data']['upazila'].forEach((element) {
      upazilas.add(Upazila.fromJson(element));
    });
    selectedUpazila.value = upazilas.first;
    isLoading.value = false;
  }

  void logout() async {
    await SharedPreferenceService.clear();
    Get.offAllNamed(Routes.AUTH);
  }
}
