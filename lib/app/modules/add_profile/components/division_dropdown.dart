import 'package:customer_info/app/modules/add_profile/controllers/add_profile_controller.dart';
import 'package:customer_info/app/modules/contacts/controllers/contacts_controller.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DivisionDropDown extends StatefulWidget {
  const DivisionDropDown({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<DivisionDropDown> createState() => _DivisionDropDownState();
}

class _DivisionDropDownState extends State<DivisionDropDown> {
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
          child: Obx(() => DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: AppColors.textColor,
                  size: 30,
                ),
                items: controller.divisions
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name!),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  controller.getDistrict(value!.id!);
                  contactController.getStoresByDivisionId(value.id!);
                  controller.selectedDivision.value = value;
                },
              )),
          // child: Obx(
          //   () => DropdownButton(
          //     underline: const SizedBox(),
          //     // isExpanded: true,
          //     itemHeight: 60,
          //     value: controller.selectedDivision.value,
          //     items: controller.divisions
          //         .map(
          //           (e) => DropdownMenuItem(
          //             value: e,
          //             child: Text(e.name!),
          //           ),
          //         )
          //         .toList(),
          //     onChanged: (value) {
          // controller.selectedDivision.value = value!;
          // controller.getDistrict(value.id!);
          // contactController.getStoresByDivisionId(value.id!);
          //     },
          //   ),
          // ),
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
