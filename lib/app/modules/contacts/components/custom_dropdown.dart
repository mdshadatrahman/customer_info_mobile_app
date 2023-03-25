import 'package:customer_info/app/data/category_model.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.title,
    required this.categoryModel,
    this.customCategory,
  });

  final List<CategoryModel> categoryModel;
  final String title;
  final List<String>? customCategory;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: AppColors.textColor,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: AppColors.textColor,
              ),
            ),
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down_sharp,
            color: AppColors.textColor,
            size: 30,
          ),
          items: List.generate(
            customCategory != null ? customCategory!.length : categoryModel.length,
            (index) => DropdownMenuItem(
              value: customCategory != null ? customCategory![index] : categoryModel[index].categoryName!,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(customCategory != null ? customCategory![index] : categoryModel[index].categoryName!),
              ),
            ),
          ),
          onChanged: (value) {
            //TODO controller.category.value = value.toString();
          },
        ),
        Positioned(
          top: -10,
          left: -10,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 2.5,
            ),
            // color: AppColors.primaryColor,
            child: Text(
              '$title *',
              style: const TextStyle(
                color: AppColors.textColor,
                fontSize: 14,
              ),
            ),
          ),
        )
      ],
    );
  }
}
