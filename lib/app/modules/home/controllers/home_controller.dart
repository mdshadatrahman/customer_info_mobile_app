import 'dart:convert';
import 'package:customer_info/app/data/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:developer' as developer show log;

class HomeController extends GetxController {
  RxList<CategoryModel> categoryModel = <CategoryModel>[].obs;

  @override
  onInit() {
    super.onInit();
    readCategoryData();
  }

  Future<void> readCategoryData() async {
    final loadedData = await rootBundle.loadString('assets/category_data.json');
    final response = await json.decode(loadedData);
    categoryModel.value = List<CategoryModel>.from(
      response.map(
        (x) => CategoryModel.fromJson(x),
      ),
    );
  }
}
