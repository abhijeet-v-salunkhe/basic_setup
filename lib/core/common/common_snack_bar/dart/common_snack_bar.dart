import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:basic_setup/core/common/enums.dart';

import '../../colour_constants/colour_constants.dart';
import '../../custom_fonts/custom_text_style.dart';

void commonSnackBar(
  BuildContext context, {
  required String message,
  required ResultType resultType,
}) {
  Color backgroundColor = successGreen;
  String title = "Success";
  if (resultType == ResultType.failure) {
    backgroundColor = failedRed;
    title = "Failed";
  } else if (resultType == ResultType.warning) {
    backgroundColor = warningYellow;
    title = "Warning";
  }
  SnackBar snackBar = SnackBar(
    content: Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: CustomTextStyle.bold(
                fontSize: 17.sp,
              ).copyWith(color: Colors.white),
            ),
            Text(
              message,
              style: CustomTextStyle.medium(
                fontSize: 12.sp,
              ).copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
