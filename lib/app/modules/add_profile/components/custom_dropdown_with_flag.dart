import 'package:country_code_picker/country_code_picker.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropDownWithFlag extends StatelessWidget {
  const CustomDropDownWithFlag({
    super.key,
    required this.title,
  });
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
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: AppColors.primaryColor,
              ),
            ),
            child: const CountryCodePicker(
              onChanged: print,
              initialSelection: 'bd',
              favorite: ['+880', 'bd'],
              showCountryOnly: true,
              showOnlyCountryWhenClosed: true,
              alignLeft: true,
              showDropDownButton: true,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              closeIcon: Icon(
                Icons.close,
                color: AppColors.primaryColor,
              ),
            ),
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
