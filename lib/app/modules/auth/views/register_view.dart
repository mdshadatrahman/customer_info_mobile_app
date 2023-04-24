import 'package:customer_info/app/modules/add_profile/components/custom_textfield.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                title: 'Name',
                keyboardType: TextInputType.phone,
                isRequired: true,
                controller: controller.nameController.value,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                title: 'Phone',
                keyboardType: TextInputType.phone,
                isRequired: true,
                controller: controller.phoneController.value,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                title: 'password',
                keyboardType: TextInputType.visiblePassword,
                isRequired: true,
                obsecureText: true,
                controller: controller.passwordController.value,
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Obx(
                () => controller.isLoading.value
                    ? const CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.register();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 50),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'Already have an account? Login.',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
