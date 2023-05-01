import 'package:customer_info/app/data/subcategory_model.dart';
import 'package:customer_info/app/modules/add_profile/components/district_dropdown.dart';
import 'package:customer_info/app/modules/add_profile/components/division_dropdown.dart';
import 'package:customer_info/app/modules/add_profile/components/upazila_dropdown.dart';
import 'package:customer_info/app/modules/contacts/components/custom_dropdown.dart';
import 'package:customer_info/app/modules/contacts/components/popup_dialog.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:customer_info/uitls/classes/circle_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/contacts_controller.dart';
import 'dart:developer' as developer show log;

class ContactsView extends GetView<ContactsController> {
  const ContactsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.addProfileController; // TODO need to find a better way
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Obx(
          () => Text(
            controller.appBarTitle.value,
            style: const TextStyle(
              color: AppColors.textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
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
              // const SizedBox(height: 30),
              // const CustomDropDownWithFlag(
              //   title: 'Country/region',
              // ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(child: Obx(() => controller.profCont.divisions.isEmpty ? const SizedBox() : const DivisionDropDown(title: 'Division'))),
                  const SizedBox(width: 10),
                  Expanded(child: Obx(() => controller.profCont.districts.isEmpty ? const SizedBox() : const DistrictDropDown(title: 'District'))),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: Obx(() => controller.profCont.upazilas.isEmpty ? const SizedBox() : const UpazilaDropDown(title: 'Upazila'))),
                  const SizedBox(width: 10),
                  const Expanded(child: SubCategoryDropdown(title: 'Sub Category')),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Obx(
                        () => Text(
                          'Available Stores: ${controller.stores.length}',
                          style: const TextStyle(
                            color: AppColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
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
              Obx(
                () => controller.isLoading.value
                    ? const SizedBox(
                        child: LinearProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : SizedBox(
                        height: Get.height * 0.55,
                        width: Get.width,
                        child: Obx(
                          () => ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.stores.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return CustomPopupDialog(
                                          store: controller.stores[index],
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
                                                  controller.stores[index].storeName ?? 'No Store Name',
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
                                                  controller.stores[index].ownerName ?? 'No Owner Name',
                                                  style: const TextStyle(
                                                    color: AppColors.primaryColor,
                                                    fontSize: 12,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                                const SizedBox(height: 2.5),
                                                Text(
                                                  controller.stores[index].phone ?? '',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
