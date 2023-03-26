import 'package:customer_info/app/data/category_model.dart';
import 'package:customer_info/app/network/api_client.dart';
import 'package:get/get.dart';
import 'dart:developer' as developer show log;

class HomeController extends GetxController {
  RxList<CategoryModel> categoryModel = <CategoryModel>[].obs;

  RxList<String> dropdownList = <String>[].obs;
  RxString selectedValue = 'Select'.obs;

  @override
  onInit() {
    super.onInit();
    // readCategoryData();
    getAllCategory();
  }

  setDropdownList() {
    dropdownList.value = categoryModel.map((e) => e.categoryName!).toList();
    selectedValue.value = dropdownList.first;
  }

  // get all category
  Future<void> getAllCategory() async {
    final response = await ApiClient().request(Request.GET, 'category');
    categoryModel.value = List<CategoryModel>.from(
      response.data.map(
        (x) => CategoryModel.fromJson(x),
      ),
    );
    setDropdownList();
  }

  //create category
  Future<void> createCategory(String name) async {
    final response = await ApiClient().request(Request.POST, 'category', data: {'category_name': name});
    categoryModel.value = List<CategoryModel>.from(
      response.data.map(
        (x) => CategoryModel.fromJson(x),
      ),
    );
    developer.log('categoryModel.value: $categoryModel', name: 'createCategory');
  }

  // Future<void> readCategoryData() async {
  //   final loadedData = await rootBundle.loadString('assets/category_data.json');
  //   final response = await json.decode(loadedData);
  //   categoryModel.value = List<CategoryModel>.from(
  //     response.map(
  //       (x) => CategoryModel.fromJson(x),
  //     ),
  //   );
  // }
}
