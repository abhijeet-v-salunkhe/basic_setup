// lib/core/widgets/app_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Button variant — controls visual style.
/// Add new variants here without touching [AppButton] internals (OCP).
enum AppButtonVariant { primary, secondary, outlined, text }

/// Button size — controls height and font size.
enum AppButtonSize { small, medium, large }

/// App-wide reusable button.
///
/// SOLID notes:
/// - Single Responsibility : renders one button; does not own any business logic.
/// - Open/Closed           : extend via [variant], [size], [prefix/suffix icon]
///                           without modifying internal rendering logic.
/// - Liskov                : [isEnabled] gracefully degrades — never throws.
/// - Interface Segregation : all params are optional except [label] + [onPressed].
/// - Dependency Inversion  : depends on theme abstractions (colorScheme/textTheme),
///                           never on hard-coded colors.
///
/// Usage examples:
/// ```dart
/// // Full-width primary (most common — e.g. Next Question)
/// AppButton(label: 'Next Question', onPressed: _goNext)
///
/// // Outlined medium with icon
/// AppButton(
///   label: 'Skip',
///   variant: AppButtonVariant.outlined,
///   size: AppButtonSize.medium,
///   prefixIcon: Icons.skip_next_rounded,
///   onPressed: _skip,
/// )
///
/// // Disabled state
/// AppButton(label: 'Submit', onPressed: _submit, isEnabled: false)
/// ```
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.large,
    this.isEnabled = true,
    this.isFullWidth = true,
    this.isLoading = false,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String label;
  final VoidCallback onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final bool isEnabled;
  final bool isFullWidth;

  /// Shows a [CircularProgressIndicator] instead of the label.
  final bool isLoading;

  final IconData? prefixIcon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final resolvedStyle = _resolveStyle(colorScheme);

    final child = isFullWidth
        ? SizedBox(
            width: double.infinity,
            height: _height,
            child: _buildButton(context, resolvedStyle, colorScheme),
          )
        : SizedBox(
            height: _height,
            child: _buildButton(context, resolvedStyle, colorScheme),
          );

    return child;
  }

  // ---------------------------------------------------------------------------
  // Private helpers
  // ---------------------------------------------------------------------------

  double get _height {
    return switch (size) {
      AppButtonSize.small => 36.h,
      AppButtonSize.medium => 46.h,
      AppButtonSize.large => 54.h,
    };
  }

  double get _fontSize {
    return switch (size) {
      AppButtonSize.small => 13.sp,
      AppButtonSize.medium => 14.sp,
      AppButtonSize.large => 16.sp,
    };
  }

  double get _iconSize {
    return switch (size) {
      AppButtonSize.small => 16.r,
      AppButtonSize.medium => 18.r,
      AppButtonSize.large => 20.r,
    };
  }

  EdgeInsetsGeometry get _padding {
    return switch (size) {
      AppButtonSize.small => EdgeInsets.symmetric(horizontal: 12.w),
      AppButtonSize.medium => EdgeInsets.symmetric(horizontal: 16.w),
      AppButtonSize.large => EdgeInsets.symmetric(horizontal: 20.w),
    };
  }

  _ButtonStyle _resolveStyle(ColorScheme colorScheme) {
    if (!isEnabled) {
      return _ButtonStyle(
        background: colorScheme.onSurface.withOpacity(0.12),
        foreground: colorScheme.onSurface.withOpacity(0.38),
        border: BorderSide.none,
        elevation: 0,
      );
    }

    return switch (variant) {
      AppButtonVariant.primary => _ButtonStyle(
        background: colorScheme.primary,
        foreground: colorScheme.onPrimary,
        border: BorderSide.none,
        elevation: 2,
      ),
      AppButtonVariant.secondary => _ButtonStyle(
        background: colorScheme.secondaryContainer,
        foreground: colorScheme.onSecondaryContainer,
        border: BorderSide.none,
        elevation: 0,
      ),
      AppButtonVariant.outlined => _ButtonStyle(
        background: Colors.transparent,
        foreground: colorScheme.primary,
        border: BorderSide(color: colorScheme.primary, width: 1.5),
        elevation: 0,
      ),
      AppButtonVariant.text => _ButtonStyle(
        background: Colors.transparent,
        foreground: colorScheme.primary,
        border: BorderSide.none,
        elevation: 0,
      ),
    };
  }

  Widget _buildButton(
    BuildContext context,
    _ButtonStyle style,
    ColorScheme colorScheme,
  ) {
    final textTheme = Theme.of(context).textTheme;

    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: style.background,
      foregroundColor: style.foreground,
      elevation: style.elevation,
      padding: _padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.r),
        side: style.border,
      ),
      // Disable the default splash when it's a text variant
      splashFactory: variant == AppButtonVariant.text
          ? NoSplash.splashFactory
          : null,
    );

    return ElevatedButton(
      onPressed: (isEnabled && !isLoading) ? onPressed : null,
      style: buttonStyle,
      child: isLoading
          ? _LoadingIndicator(color: style.foreground, size: _iconSize)
          : _ButtonContent(
              label: label,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              iconSize: _iconSize,
              textStyle: textTheme.labelLarge?.copyWith(
                fontSize: _fontSize,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.4,
                color: style.foreground,
              ),
            ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Private sub-widgets — each has a single responsibility
// ─────────────────────────────────────────────────────────────────────────────

/// Holds resolved colors/border for one button state.
class _ButtonStyle {
  const _ButtonStyle({
    required this.background,
    required this.foreground,
    required this.border,
    required this.elevation,
  });

  final Color background;
  final Color foreground;
  final BorderSide border;
  final double elevation;
}

/// Renders label + optional prefix/suffix icons.
class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    required this.label,
    required this.textStyle,
    required this.iconSize,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String label;
  final TextStyle? textStyle;
  final double iconSize;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (prefixIcon != null) ...[
          Icon(prefixIcon, size: iconSize),
          SizedBox(width: 8.w),
        ],
        Text(label, style: textStyle),
        if (suffixIcon != null) ...[
          SizedBox(width: 8.w),
          Icon(suffixIcon, size: iconSize),
        ],
      ],
    );
  }
}

/// Spinner shown during [isLoading] state.
class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
