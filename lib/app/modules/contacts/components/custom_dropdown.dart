import 'package:customer_info/app/modules/add_profile/controllers/add_profile_controller.dart';
import 'package:customer_info/app/modules/contacts/controllers/contacts_controller.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoryDropdown extends StatefulWidget {
  const SubCategoryDropdown({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<SubCategoryDropdown> createState() => _SubCategoryDropdownState();
}

class _SubCategoryDropdownState extends State<SubCategoryDropdown> {
  final controller = Get.find<ContactsController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
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
              items: controller.subCategories
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.subCategoryName!),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                controller.getStoresBySubCategoryId(value!.subCategoryId!);
                setState(() {
                  controller.selectedSubCategory.value = value;
                });
              },
            ),
          ),
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
