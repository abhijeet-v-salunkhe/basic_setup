import 'package:get/get.dart';
import 'package:basic_setup/core/common/common_dialog/dialog_widget.dart';

void showCommonDialog({bool barrierDismissible = false}) {
  var result = Get.dialog(
    DialogWidget(),
    barrierDismissible: barrierDismissible,
  );
}
