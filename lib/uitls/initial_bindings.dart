import 'package:customer_info/uitls/shared_prefs_service.dart';
import 'package:get/get.dart';

import 'api_client.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    ApiClient.init();
    Get.putAsync<SharedPreferenceService>(
      () => SharedPreferenceService().init(),
    );
  }
}
