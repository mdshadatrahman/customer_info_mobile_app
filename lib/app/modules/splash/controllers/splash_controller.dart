import 'package:customer_info/app/data/user_model.dart';
import 'package:customer_info/app/modules/home/controllers/home_controller.dart';
import 'package:customer_info/app/routes/app_pages.dart';
import 'package:customer_info/uitls/api_client.dart';
import 'package:customer_info/uitls/shared_prefs_service.dart';
import 'package:customer_info/uitls/url.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:developer' as developer show log;

class SplashController extends GetxController {
  Rx<User> user = User().obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    dependencies();
    checkUser();
    super.onInit();
  }

  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }

  checkUser() async {
    await Get.putAsync<SharedPreferenceService>(
      () => SharedPreferenceService().init(),
    );
    isLoading.value = true;
    // try {
    if (SharedPreferenceService.getToken() != null) {
      final test = await ApiClient.instance.get(url: URL.currentUser);
      user.value = User.fromJson(test);
      if (user.value.user?.power == 1) {
        isLoading.value = false;
        Get.offAllNamed(Routes.HOME);
      } else if (user.value.user?.power == 2) {
        isLoading.value = false;
        Get.offAllNamed(Routes.ADD_PROFILE);
      } else {
        Fluttertoast.showToast(msg: 'Unknown user');
      }
    } else {
      isLoading.value = false;
      Get.offAllNamed(Routes.AUTH);
    }
    // } catch (e) {
    //   isLoading.value = false;
    //   developer.log(e.toString());
    //   Fluttertoast.showToast(msg: 'Something went wrong');
    // }
    isLoading.value = false;
  }
}
