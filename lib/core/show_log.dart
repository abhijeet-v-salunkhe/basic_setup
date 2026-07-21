import 'package:flutter/foundation.dart';

void showLog(String msg) {
  if (kDebugMode) {
    debugPrint("LC : $msg");
  }
}
