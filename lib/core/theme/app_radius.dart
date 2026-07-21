// lib/core/theme/app_radius.dart
//
// ⚡ SUGGESTED ADDITION — single source of truth for border radii.
// Keeps rounded corners consistent across the whole app.
//
// Usage (with screenutil):
//   borderRadius: BorderRadius.circular(AppRadius.card.r)
//   borderRadius: BorderRadius.circular(AppRadius.button.r)

abstract final class AppRadius {
  static const double xs = 6.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double card = 16.0;
  static const double lg = 20.0;
  static const double xl = 28.0;
  static const double button = 14.0;

  /// Fully circular — use for chips, avatars, badges
  static const double full = 999.0;
}
