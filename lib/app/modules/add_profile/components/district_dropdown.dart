import 'package:customer_info/app/modules/add_profile/controllers/add_profile_controller.dart';
import 'package:customer_info/app/modules/contacts/controllers/contacts_controller.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DistrictDropDown extends StatefulWidget {
  const DistrictDropDown({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<DistrictDropDown> createState() => _DistrictDropDownState();
}

class _DistrictDropDownState extends State<DistrictDropDown> {
  final controller = Get.find<AddProfileController>();
  final contactController = Get.find<ContactsController>();

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
              value: controller.selectedDistrict.value,
              items: controller.districts
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name!),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                controller.getUpazila(value!.id!);
                contactController.getStoresByDistrictId(value.id!);
                setState(() {
                  controller.selectedDistrict.value = value;
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
