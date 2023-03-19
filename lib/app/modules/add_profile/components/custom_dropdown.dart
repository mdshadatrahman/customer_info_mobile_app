import 'package:customer_info/app/data/category_model.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.title,
    required this.categoryModel,
  });

  final List<CategoryModel> categoryModel;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          DropdownButtonFormField(
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
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
              child: Text(
                '$title *',
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
