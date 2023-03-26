import 'package:customer_info/app/modules/add_profile/components/add_category_dialog.dart';
import 'package:customer_info/app/modules/add_profile/components/address_dropdown.dart';
import 'package:customer_info/app/modules/add_profile/components/category_dropdown.dart';
import 'package:customer_info/app/modules/add_profile/components/custom_dropdown_with_flag.dart';
import 'package:customer_info/app/modules/add_profile/components/custom_textfield.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:customer_info/uitls/classes/circle_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
              'Add Store',
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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                      height: 100,
                      width: 100,
                      color: AppColors.primaryColor,
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: SvgPicture.asset(
                          'assets/svg/plus.svg',
                          width: 50,
                          height: 50,
                          fit: BoxFit.scaleDown,
                        ),
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
                const SizedBox(height: 20),
                controller.homeController.categoryModel.isEmpty
                    ? Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => const AddNewCategory(),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Add New Category'),
                          ),
                        ),
                      )
                    : const CategoryDropDown(
                        title: 'Profile Category',
                      ),

                const SizedBox(height: 20),
                Row(
                  children: const [
                    Expanded(
                      child: CustomTextField(
                        title: 'Store Name',
                        keyboardType: TextInputType.name,
                        isRequired: true,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                        title: 'Owner Name',
                        keyboardType: TextInputType.name,
                        isRequired: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const CustomTextField(
                  title: 'Mobile Number',
                  keyboardType: TextInputType.phone,
                  isRequired: true,
                ),
                const SizedBox(height: 20),
                const CustomTextField(
                  title: 'Store Address',
                  keyboardType: TextInputType.streetAddress,
                  isRequired: true,
                ),
                const SizedBox(height: 20),

                const CustomDropDownWithFlag(
                  title: 'Country/region',
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Expanded(
                      child: AddressDropDown(title: 'Division'),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: AddressDropDown(title: 'District'),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Expanded(
                      child: AddressDropDown(title: 'Thana'),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                const CustomTextField(
                  title: 'Website',
                  keyboardType: TextInputType.url,
                  isRequired: false,
                ),
                const SizedBox(height: 20),
                const CustomTextField(
                  title: 'About Store',
                  keyboardType: TextInputType.streetAddress,
                  isRequired: false,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    //TODO controller.submitProfile();
                  },
                  child: Container(
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Add Store',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
