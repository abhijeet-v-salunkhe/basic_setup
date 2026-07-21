// lib/core/theme/app_text_styles.dart
//
// ⚡ SUGGESTED ADDITION — avoids repeating style overrides across the app.
//
// These are CONTEXT-AWARE helpers (require BuildContext).
// Usage:
//   Text('Hello', style: AppTextStyles.headlineMedium(context))
//
// Each method reads from the current theme's TextTheme and applies a
// standard override, so they work automatically in both light & dark mode.

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class AppTextStyles {
  // ── Display ────────────────────────────────────────────────────────────────
  static TextStyle displayLarge(BuildContext context) => Theme.of(context)
      .textTheme
      .displayLarge!
      .copyWith(fontWeight: FontWeight.w800, fontSize: 36.sp);

  // ── Headline ───────────────────────────────────────────────────────────────
  static TextStyle headlineMedium(BuildContext context) => Theme.of(context)
      .textTheme
      .headlineMedium!
      .copyWith(fontWeight: FontWeight.w700, fontSize: 22.sp);

  // ── Title ──────────────────────────────────────────────────────────────────
  static TextStyle titleLarge(BuildContext context) => Theme.of(context)
      .textTheme
      .titleLarge!
      .copyWith(fontWeight: FontWeight.w700, fontSize: 18.sp);

  static TextStyle titleMedium(BuildContext context) => Theme.of(context)
      .textTheme
      .titleMedium!
      .copyWith(fontWeight: FontWeight.w600, fontSize: 16.sp);

  // ── Body ───────────────────────────────────────────────────────────────────
  static TextStyle bodyLarge(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15.sp);

  static TextStyle bodyMedium(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14.sp);

  static TextStyle bodySmall(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12.sp);

  // ── Label ──────────────────────────────────────────────────────────────────
  static TextStyle labelLarge(BuildContext context) =>
      Theme.of(context).textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 15.sp,
        letterSpacing: 0.4,
      );

  // ── Code (monospace) ───────────────────────────────────────────────────────
  static TextStyle code(BuildContext context) => TextStyle(
    fontFamily: 'monospace',
    fontSize: 14.sp,
    color: Theme.of(context).colorScheme.onSurfaceVariant,
    letterSpacing: 0.3,
    height: 1.6,
  );
}
