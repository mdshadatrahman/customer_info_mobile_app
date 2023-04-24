import 'package:customer_info/app/modules/add_profile/components/custom_textfield.dart';
import 'package:customer_info/app/modules/auth/views/register_view.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
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
                            controller.login();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
              ),

              //Register navigation

              const SizedBox(height: 50),
              TextButton(
                onPressed: () {
                  Get.to(() => const RegisterView());
                },
                child: const Text(
                  'Register?',
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
