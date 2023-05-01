import 'package:customer_info/app/modules/add_profile/components/add_category_dialog.dart';
import 'package:customer_info/app/modules/add_profile/components/add_subategory_dialog.dart';
import 'package:customer_info/app/modules/add_profile/controllers/add_profile_controller.dart';
import 'package:customer_info/app/modules/home/controllers/home_controller.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoryDropDown extends StatefulWidget {
  const SubCategoryDropDown({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<SubCategoryDropDown> createState() => _SubCategoryDropDownState();
}

class _SubCategoryDropDownState extends State<SubCategoryDropDown> {
  final controller = Get.find<HomeController>();
  final addProfileController = Get.find<AddProfileController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.primaryColor,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Obx(
                  () => DropdownButton(
                    underline: const SizedBox(),
                    isExpanded: true,
                    itemHeight: 60,
                    value: controller.selectedSubCategory.value,
                    items: controller.subCategoryModel
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.subCategoryName!),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        controller.selectedSubCategory.value = value!;
                        addProfileController.selectedSubCategory.value = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                width: 20,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const AddNewSubCategory(),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: -10,
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 2.5,
            ),
            color: AppColors.primaryColor,
            child: Text(
              '${widget.title} *',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 14,
              ),
            ),
          ),
        )
      ],
    );
  }
}
