import 'package:customer_info/app/data/category_model.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.car_crash,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoryModel.title!,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      categoryModel.subtitle!,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
