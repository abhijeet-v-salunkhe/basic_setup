import 'package:flutter/material.dart';
import 'package:basic_setup/core/theme/app_colors.dart';

extension CustomColors on ColorScheme {
  bool get isDark => brightness == Brightness.dark;

  Color get success => isDark ? AppColors.successDark : AppColors.successLight;

  Color get onSuccess =>
      isDark ? AppColors.onSuccessDark : AppColors.onSuccessLight;

  Color get successContainer =>
      isDark ? AppColors.successContainerDark : AppColors.successContainerLight;

  Color get onSuccessContainer => isDark
      ? AppColors.onSuccessContainerDark
      : AppColors.onSuccessContainerLight;
}
