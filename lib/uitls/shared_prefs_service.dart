import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService extends GetxService {
  static SharedPreferenceService to = Get.find();
  static const String _token = "token";
  static late SharedPreferences _sharedPreferences;

  Future<SharedPreferenceService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  static String? getToken() {
    return _sharedPreferences.getString(_token);
  }

  static void setToken(String token) {
    _sharedPreferences.setString(_token, token);
  }

  static Future<void> clear() async {
    await _sharedPreferences.clear();
    return;
  }
}
