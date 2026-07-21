// lib/core/theme/app_spacing.dart
//
// ⚡ SUGGESTED ADDITION — speeds up UI development significantly.
//
// Usage example:
//   SizedBox(height: AppSpacing.md)   →  16px logical pixels
//   padding: EdgeInsets.all(AppSpacing.sm)
//
// In widgets that use flutter_screenutil, ALWAYS use the .h / .w / .r
// extension on these constants:
//   SizedBox(height: AppSpacing.md.h)
//   EdgeInsets.symmetric(horizontal: AppSpacing.lg.w)

abstract final class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  // Page-level horizontal padding — use everywhere for consistent margins
  static const double pagePadding = 20.0;
}
