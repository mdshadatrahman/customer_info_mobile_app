import 'package:customer_info/app/data/category_model.dart';
import 'package:customer_info/app/data/subcategory_model.dart';
import 'package:customer_info/app/modules/contacts/bindings/contacts_binding.dart';
import 'package:customer_info/app/routes/app_pages.dart';
import 'package:customer_info/uitls/shared_prefs_service.dart';
import 'package:get/get.dart';
import '../../../../uitls/api_client.dart';

class HomeController extends GetxController {
  RxList<CategoryModel> categoryModel = <CategoryModel>[].obs;
  Rx<CategoryModel> selectedCategory = CategoryModel().obs;

  RxList<Subcategory> subCategoryModel = <Subcategory>[].obs;
  Rx<Subcategory> selectedSubCategory = Subcategory().obs;

  @override
  onInit() {
    getAllCategory();
    ContactsBinding().dependencies();
    super.onInit();
  }

  setDropdownList() {
    if (categoryModel.isNotEmpty) {
      selectedCategory.value = categoryModel.first;
      getAllSubCategories(selectedCategory.value.id!);
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

  Future<void> getAllSubCategories(int categoryId) async {
    final response = await ApiClient().get(url: 'sub-category/category/$categoryId');
    subCategoryModel.value = List<Subcategory>.from(
      response.map(
        (x) => Subcategory.fromJson(x),
      ),
    );
    if (subCategoryModel.isNotEmpty) {
      selectedSubCategory.value = subCategoryModel.first;
    }
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

  Future<void> createSubCategory(int categoryId, String name) async {
    await ApiClient().post(
      url: 'sub-category',
      body: {
        'category_id': categoryId,
        'sub_category_name': name,
      },
    );
    getAllSubCategories(categoryId);
  }

  void logout() async {
    await SharedPreferenceService.clear();
    Get.offAllNamed(Routes.AUTH);
  }
}
