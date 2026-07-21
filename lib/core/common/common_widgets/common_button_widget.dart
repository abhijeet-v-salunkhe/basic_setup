import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:basic_setup/core/common/colour_constants/colour_constants.dart';
import 'package:basic_setup/core/common/custom_fonts/custom_text_style.dart';

class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget({
    super.key,
    required this.buttonName,
    required this.onTap,
    this.buttonColor,
    this.width,
    this.buttonNameColour,
  });

  final String buttonName;
  final Color? buttonNameColour;
  final Color? buttonColor;
  final double? width;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.w),
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: buttonColor,
        ),
        child: Center(
          child: Text(
            buttonName,
            style: CustomTextStyle.semiBold(
              fontSize: 15.sp,
            ).copyWith(color: buttonNameColour ?? whiteColor),
          ),
        ),
      ),
    );
  }
}
