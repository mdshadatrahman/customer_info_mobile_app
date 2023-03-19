import 'package:customer_info/app/modules/add_profile/components/custom_dropdown.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:customer_info/uitls/classes/circle_clipper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_profile_controller.dart';

class AddProfileView extends GetView<AddProfileController> {
  const AddProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const [
            Text(
              'Add Profile',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
              ),
            ),
            Text(
              'Submit profile details here',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 12,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.textColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  //TODO controller.getImage();
                },
                child: ClipPath(
                  clipper: CircleClipper(),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: AppColors.primaryColor,
                    child: const Icon(
                      Icons.add_a_photo_outlined,
                      size: 100,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Add Profile Picture',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),

              //Categories dropdown
              const SizedBox(height: 20),
              CustomDropDown(
                categoryModel: controller.homeController.categoryModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
