import 'package:customer_info/uitls/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.keyboardType,
    required this.isRequired,
    required this.controller,
    this.obsecureText = false,
  });
  final String title;
  final TextInputType keyboardType;
  final bool isRequired;
  final TextEditingController? controller;
  final bool obsecureText;

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
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obsecureText,
            validator: (value) {
              if (isRequired) {
                if (value!.isEmpty) {
                  return 'This field is required';
                }
              }
              return null;
            },
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
            onChanged: (value) {},
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
              child: Row(
                children: [
                  Text(
                    '$title ',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                    ),
                  ),
                  isRequired
                      ? const Text(
                          '*',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                          ),
                        )
                      : const Text(
                          '',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                          ),
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
