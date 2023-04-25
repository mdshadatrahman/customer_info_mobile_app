import 'package:customer_info/app/data/category_model.dart';
import 'package:get/get.dart';
import 'dart:developer' as developer show log;

import '../../../../uitls/api_client.dart';

class HomeController extends GetxController {
  RxList<CategoryModel> categoryModel = <CategoryModel>[].obs;
  Rx<CategoryModel> selectedCategory = CategoryModel().obs;

  @override
  onInit() {
    super.onInit();
    getAllCategory();
  }

  setDropdownList() {
    if (categoryModel.isNotEmpty) {
      selectedCategory.value = categoryModel.first;
    }
  }

  // get all category
  Future<void> getAllCategory() async {
    final response = await ApiClient().get(url: 'category');
    categoryModel.value = List<CategoryModel>.from(
      response.map(
        (x) => CategoryModel.fromJson(x),
      ),
    );
    setDropdownList();
  }

  //create category
  Future<void> createCategory(String name) async {
    await ApiClient().post(url: 'category', body: {'category_name': name});
    getAllCategory();

    // categoryModel.value = List<CategoryModel>.from(
    //   response.data.map(
    //     (x) => CategoryModel.fromJson(x),
    //   ),
    // );
  }
}
