import 'package:customer_info/app/data/store_model.dart';
import 'package:customer_info/app/data/subcategory_model.dart';
import 'package:customer_info/app/modules/add_profile/controllers/add_profile_controller.dart';
import 'package:customer_info/uitls/api_client.dart';
import 'package:get/get.dart';

class ContactsController extends GetxController {
  final addProfileController = Get.lazyPut(() => AddProfileController());

  RxList<StoreModel> stores = <StoreModel>[].obs;
  RxList<Subcategory> subCategories = <Subcategory>[].obs;
  Rx<Subcategory> selectedSubCategory = Subcategory().obs;
  RxBool isLoading = false.obs;
  RxString appBarTitle = ''.obs;

  @override
  void onInit() {
    getStoresByCategoryId();
    getSubCategoriesByCategoryId();
    super.onInit();
  }

  getStoresByCategoryId() async {
    isLoading.value = true;
    appBarTitle.value = Get.arguments['categoryName'];
    final response = await ApiClient.instance.get(url: 'store/category/${Get.arguments['categoryId']}');
    if (response != null) {
      stores.clear();
      response.forEach((element) {
        stores.add(StoreModel.fromJson(element));
      });
    }
    isLoading.value = false;
  }

  getSubCategoriesByCategoryId() async {
    isLoading.value = true;
    final response = await ApiClient.instance.get(url: 'sub-category/category/${Get.arguments['categoryId']}');
    if (response != null) {
      subCategories.clear();
      response.forEach((element) {
        subCategories.add(Subcategory.fromJson(element));
      });
      selectedSubCategory.value = subCategories[0];
    }
    isLoading.value = false;
  }

  Future<void> getStoresBySubCategoryId(int subCategoryId) async {
    isLoading.value = true;
    final response = await ApiClient.instance.get(url: 'store/sub-category/$subCategoryId');
    if (response != null) {
      stores.clear();
      response.forEach((element) {
        stores.add(StoreModel.fromJson(element));
      });
    }
    isLoading.value = false;
  }

  Future<void> getStoresByDivisionId(int divisionId) async {
    isLoading.value = true;
    final response = await ApiClient.instance.get(url: 'store/division/$divisionId');
    if (response != null) {
      stores.clear();
      response.forEach((element) {
        stores.add(StoreModel.fromJson(element));
      });
    }
    isLoading.value = false;
  }

  Future<void> getStoresByDistrictId(int districtId) async {
    isLoading.value = true;
    final response = await ApiClient.instance.get(url: 'store/district/$districtId');
    if (response != null) {
      stores.clear();
      response.forEach((element) {
        stores.add(StoreModel.fromJson(element));
      });
    }
    isLoading.value = false;
  }

  Future<void> getStoresByUpazilaId(int upazilaId) async {
    isLoading.value = true;
    final response = await ApiClient.instance.get(url: 'store/upazila/$upazilaId');
    if (response != null) {
      stores.clear();
      response.forEach((element) {
        stores.add(StoreModel.fromJson(element));
      });
    }
    isLoading.value = false;
  }
}
