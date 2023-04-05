import 'package:customer_info/app/modules/show_all/components/popup_dialog.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:customer_info/uitls/classes/circle_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/show_all_controller.dart';

class ShowAllView extends GetView<ShowAllController> {
  const ShowAllView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'All Stores',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
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
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Available Stores',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      SvgPicture.asset('assets/svg/active.svg'),
                    ],
                  ),
                  Expanded(child: Container())
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: Get.height * 0.8,
                width: Get.width,
                child: Obx(
                  () => ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.storeModel.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return CustomPopupDialog(
                                  storeModel: controller.storeModel[index],
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.shadow.withOpacity(0.1),
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //profile image
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      child: ClipPath(
                                        clipper: CircleClipper(),
                                        child: Container(
                                          height: 45,
                                          width: 45,
                                          color: AppColors.primaryColor,
                                          child: const Icon(
                                            Icons.person,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller.storeModel[index].storeName ?? '',
                                          style: const TextStyle(
                                            // decoration: TextDecoration.underline,
                                            color: AppColors.textColor,
                                            fontSize: 14,
                                            letterSpacing: 1.2,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 2.5),
                                        Text(
                                          controller.storeModel[index].ownerName ?? '',
                                          style: const TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: 12,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                        const SizedBox(height: 2.5),
                                        Text(
                                          controller.storeModel[index].phone ?? '',
                                          style: const TextStyle(
                                            color: AppColors.textColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: SvgPicture.asset('assets/svg/call.svg'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
