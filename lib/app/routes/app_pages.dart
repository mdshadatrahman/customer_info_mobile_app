import 'package:get/get.dart';

import '../modules/add_profile/bindings/add_profile_binding.dart';
import '../modules/add_profile/views/add_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PROFILE,
      page: () => const AddProfileView(),
      binding: AddProfileBinding(),
    ),
  ];
}
