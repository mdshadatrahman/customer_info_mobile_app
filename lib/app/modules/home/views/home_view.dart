import 'package:customer_info/app/modules/home/components/category_view.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:customer_info/uitls/classes/circle_clipper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  ClipPath(
                    clipper: CircleClipper(),
                    child: Container(
                      height: 60,
                      width: 60,
                      color: AppColors.primaryColor,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              //Categories Text
              Text(
                'categories'.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              //Categories List
              const SizedBox(height: 20),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.categoryModel.length,
                    itemBuilder: (context, index) {
                      return index != controller.categoryModel.length - 1
                          ? CategoryView(
                              categoryModel: controller.categoryModel[index],
                            )
                          : Column(
                              children: [
                                CategoryView(
                                  categoryModel: controller.categoryModel[index],
                                ),
                                const SizedBox(height: 100),
                              ],
                            );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
