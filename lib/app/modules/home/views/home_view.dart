import 'package:customer_info/app/modules/home/components/category_view.dart';
import 'package:customer_info/app/routes/app_pages.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:customer_info/uitls/classes/circle_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  ClipPath(
                    clipper: CircleClipper(),
                    child: Container(
                      height: 60,
                      width: 60,
                      color: AppColors.primaryColor,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              //Categories Text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'categories'.toUpperCase(),
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Select a category to view profiles',
                    style: TextStyle(
                      color: AppColors.textColor.withOpacity(0.8),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),

              //Categories List
              const SizedBox(height: 20),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.categoryModel.length,
                    itemBuilder: (context, index) {
                      return index != controller.categoryModel.length - 1
                          ? CategoryView(
                              categoryModel: controller.categoryModel[index],
                              onTapped: () => Get.toNamed(Routes.CONTACTS),
                            )
                          : Column(
                              children: [
                                CategoryView(
                                  categoryModel: controller.categoryModel[index],
                                  onTapped: () => Get.toNamed(Routes.CONTACTS),
                                ),
                                const SizedBox(height: 100),
                              ],
                            );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_PROFILE);
        },
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(10),
        //   ),
        // ),
        backgroundColor: AppColors.primaryColor,
        child: SvgPicture.asset(
          'assets/svg/plus.svg',
          height: 20,
          width: 20,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
