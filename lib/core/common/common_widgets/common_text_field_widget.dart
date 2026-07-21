import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:basic_setup/core/common/colour_constants/colour_constants.dart';
import 'package:basic_setup/core/common/custom_fonts/custom_text_style.dart';

class CommonTextFieldWidget extends StatelessWidget {
  const CommonTextFieldWidget({
    super.key,
    this.hintText,
    this.isRequired = false,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.controller,
    this.onEditingComplete,
    this.onTapOutside,
    this.readOnly = false,
    this.onTap,
    this.initialValue,
    required this.labelText,
    this.focusNode,
    this.onChanged,
    this.errorText,
  });

  final String? hintText;
  final String labelText;
  final bool isRequired;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final void Function()? onEditingComplete;
  final void Function(PointerDownEvent)? onTapOutside;
  final bool readOnly;
  final void Function()? onTap;
  final String? initialValue;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final String? errorText;

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
          forceErrorText: errorText,
          onChanged: onChanged,
          focusNode: focusNode,
          initialValue: initialValue,
          readOnly: readOnly,
          controller: controller,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            hintText: hintText,
            hintStyle: CustomTextStyle.regular(fontSize: 13.sp),
          ),
          validator: validator,
          onTapOutside: onTapOutside,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
        ),
      ],
    );
  }
}
