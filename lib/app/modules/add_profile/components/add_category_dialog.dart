import 'package:customer_info/app/modules/home/controllers/home_controller.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

// class AddNewCategory extends StatefulWidget {
//   const AddNewCategory({super.key});

//   @override
//   State<AddNewCategory> createState() => _AddNewCategoryState();
// }

class AddNewCategory extends HookWidget {
  const AddNewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = useTextEditingController();

    return AlertDialog(
      title: const Text('Add New Category'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: categoryController,
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
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  final controller = Get.find<HomeController>();
                  controller.createCategory(categoryController.text);
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
