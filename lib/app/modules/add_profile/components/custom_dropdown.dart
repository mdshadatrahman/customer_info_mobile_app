import 'package:customer_info/app/data/category_model.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.categoryModel,
  });

  final List<CategoryModel> categoryModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down_sharp,
            color: AppColors.textColor,
            size: 30,
          ),
          items: List.generate(
            categoryModel.length,
            (index) => DropdownMenuItem(
              value: categoryModel[index].title!,
              child: Text(categoryModel[index].title!),
            ),
          ),
          onChanged: (value) {
            //TODO controller.category.value = value.toString();
          },
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
            child: const Text(
              'Profile Category *',
              style: TextStyle(
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
