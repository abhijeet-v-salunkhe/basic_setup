import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:basic_setup/core/common/colour_constants/colour_constants.dart';

class CommonLoader {
  static void show() {
    Get.dialog(
      barrierDismissible: false,
      Center(
        child: Dialog(
          child: Container(
            alignment: Alignment.center,
            height: 70,
            width: 30,
            color: Colors.white,
            child: ListTile(
              leading: CircularProgressIndicator(
                backgroundColor: secondaryPurpleColor,
                color: Colors.white,
              ),
              title: Text('Loading'),
            ),
          ),
        ),
      ),
    );
  }

  static void hide() {
    log("In the hideLoader Get.isDialogOpen : ${Get.isDialogOpen}");
    if (Get.isDialogOpen ?? false) {
      Navigator.of(Get.overlayContext!).pop();
    }
  }
}

showLoader() => CommonLoader.show();

hideLoader() => CommonLoader.hide();
