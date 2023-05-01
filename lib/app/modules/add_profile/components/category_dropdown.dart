import 'dart:developer';

import 'package:customer_info/app/modules/add_profile/components/add_category_dialog.dart';
import 'package:customer_info/app/modules/add_profile/controllers/add_profile_controller.dart';
import 'package:customer_info/app/modules/home/controllers/home_controller.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDropDown extends StatefulWidget {
  const CategoryDropDown({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<CategoryDropDown> createState() => _CategoryDropDownState();
}

class _CategoryDropDownState extends State<CategoryDropDown> {
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
                    value: controller.selectedCategory.value,
                    items: controller.categoryModel
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.categoryName!),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        controller.selectedCategory.value = value!;
                      });
                      addProfileController.selectedCategory.value = value!;
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
                      builder: (context) => const AddNewCategory(),
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
