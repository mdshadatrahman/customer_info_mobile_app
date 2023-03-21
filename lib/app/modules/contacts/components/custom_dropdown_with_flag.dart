import 'package:country_code_picker/country_code_picker.dart';
import 'package:customer_info/uitls/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownWithFlag extends StatelessWidget {
  const CustomDropDownWithFlag({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            const CountryCodePicker(
              backgroundColor: Colors.transparent,
              onChanged: print,
              initialSelection: 'bd',
              favorite: ['+880', 'bd'],
              showCountryOnly: true,
              showOnlyCountryWhenClosed: true,
              alignLeft: true,
              showDropDownButton: true,
              padding: EdgeInsets.only(left: 10, right: 10, top: 5),
              textStyle: TextStyle(
                color: AppColors.textColor,
                fontSize: 14,
              ),
              closeIcon: Icon(
                Icons.close,
                color: AppColors.primaryColor,
              ),
              searchStyle: TextStyle(
                color: AppColors.textColor,
                fontSize: 14,
              ),
            ),
            //horizontal bar
            Divider(
              color: AppColors.textColor.withOpacity(0.5),
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
          ],
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
