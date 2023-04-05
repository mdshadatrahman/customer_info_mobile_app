import 'package:get/get.dart';

import '../controllers/show_all_controller.dart';

class ShowAllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowAllController>(
      () => ShowAllController(),
    );
  }
}
