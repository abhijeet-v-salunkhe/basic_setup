import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:basic_setup/core/common/colour_constants/colour_constants.dart';
import 'package:basic_setup/core/common/custom_fonts/custom_text_style.dart';

class CommonDatePickerWidget extends StatelessWidget {
  const CommonDatePickerWidget({
    super.key,
    this.hintText,
    this.isRequired = false,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.controller,
    this.onTapOutside,
    required this.labelText,
  });

  final String? hintText;
  final String labelText;
  final bool isRequired;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final void Function(PointerDownEvent)? onTapOutside;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 3.w,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: labelText,
            style: CustomTextStyle.medium(fontSize: 13.sp),
            children: [
              if (isRequired)
                TextSpan(
                  text: "*",
                  style: CustomTextStyle.medium(
                    fontSize: 13.sp,
                    color: requiredAsteriskColour,
                  ),
                ),
            ],
          ),
        ),
        TextFormField(
          readOnly: true,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            hintText: hintText,
            hintStyle: CustomTextStyle.regular(fontSize: 13.sp),
          ),
          onTap: () async {
            log("On tap Date time text field");
            DateTime currentDate = DateTime.now();

            DateTime? date = await showDatePicker(
              context: context,
              initialDate: currentDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(currentDate.year + 2),
            );
            log("date : ${date.toString()}");
            controller?.text = date.toString();
            log("Controller.text : ${controller?.text}");
          },
          onTapOutside: onTapOutside,
        ),
      ],
    );
  }
}
