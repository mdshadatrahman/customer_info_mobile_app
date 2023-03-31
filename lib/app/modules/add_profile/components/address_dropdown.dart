import 'package:customer_info/app/modules/add_profile/components/add_category_dialog.dart';
import 'package:customer_info/app/modules/home/controllers/home_controller.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDropDown extends StatefulWidget {
  const AddressDropDown({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<AddressDropDown> createState() => _AddressDropDownState();
}

class _AddressDropDownState extends State<AddressDropDown> {
  final controller = Get.find<HomeController>();
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
          child: DropdownButton(
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
            },
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
