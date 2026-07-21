// lib/core/theme/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // 🎯 Change ONLY these 3-4 colors to retheme your entire app
  static const Color primary = Color(0xFF6750A4); // Main brand color
  static const Color secondary = Color(0xFF625B71); // Accents, FABs
  static const Color tertiary = Color(0xFF7D5260); // Highlights
  static const Color error = Color(0xFFB3261E); // Errors

  // Optional: custom surface/background overrides
  // If not set, Flutter derives these automatically from primary
  // static const Color surface = Color(0xFFFFFBFE);

  // 🌿 LIGHT THEME
  static const successLight = Color(0xFF2E7D32);
  static const onSuccessLight = Colors.white;
  static const successContainerLight = Color(0xFFA5D6A7);
  static const onSuccessContainerLight = Color(0xFF1B5E20);

  // 🌙 DARK THEME
  static const successDark = Color(0xFF81C784);
  static const onSuccessDark = Color(0xFF003910);
  static const successContainerDark = Color(0xFF1B5E20);
  static const onSuccessContainerDark = Color(0xFFA5D6A7);
}
