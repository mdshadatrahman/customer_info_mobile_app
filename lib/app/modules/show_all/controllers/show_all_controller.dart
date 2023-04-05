import 'package:customer_info/app/data/store_model.dart';
import 'package:customer_info/uitls/api_client.dart';
import 'package:get/get.dart';
import 'dart:developer' as developer show log;

class ShowAllController extends GetxController {
  RxList<StoreModel> storeModel = <StoreModel>[].obs;

  @override
  void onInit() {
    getAllStores();
    super.onInit();
  }

  getAllStores() async {
    final response = await ApiClient().get(url: 'store');

    if (response != null) {
      response.forEach((element) {
        storeModel.add(StoreModel.fromJson(element));
      });
    }
  }
}
