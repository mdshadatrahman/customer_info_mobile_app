import 'package:customer_info/app/modules/contacts/components/custom_dropdown.dart';
import 'package:customer_info/app/modules/contacts/components/popup_dialog.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:customer_info/uitls/classes/circle_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:customer_info/app/modules/contacts/components/custom_dropdown_with_flag.dart';
import '../controllers/contacts_controller.dart';

class ContactsView extends GetView<ContactsController> {
  const ContactsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Departmental Stores',
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
              const SizedBox(height: 30),
              const CustomDropDownWithFlag(
                title: 'Country/region',
              ),
              const SizedBox(height: 25),
              Row(
                children: const [
                  Expanded(
                    child: CustomDropDown(
                      title: 'Division',
                      categoryModel: [],
                      customCategory: [
                        'Khulna',
                        'Dhaka',
                        'Rajshahi',
                        'Chittagong',
                        'Barisal',
                        'Sylhet',
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomDropDown(
                      title: 'City/area',
                      categoryModel: [],
                      customCategory: [
                        'Chuadanga',
                        'Jhenaidah',
                        'Khulna',
                        'Kushtia',
                        'Magura',
                        'Meherpur',
                        'Narail',
                        'Satkhira',
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
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
                height: Get.height * 0.55,
                width: Get.width,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const CustomPopupDialog();
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
                                    children: const [
                                      Text(
                                        'City General Store',
                                        style: TextStyle(
                                          // decoration: TextDecoration.underline,
                                          color: AppColors.textColor,
                                          fontSize: 14,
                                          letterSpacing: 1.2,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 2.5),
                                      Text(
                                        'Md Sadman Sakib',
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 12,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                      SizedBox(height: 2.5),
                                      Text(
                                        '+880 1000 000000',
                                        style: TextStyle(
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
            ],
          ),
        ),
      ),
    );
  }
}
