import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Provides theme-aware color access.
/// Use these instead of hardcoded AppColors text/surface values in widgets.
extension AdaptiveColors on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  Color get textPrimary =>
      isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;
  Color get textSecondary =>
      isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;
  Color get textLight =>
      isDark ? AppColors.darkTextLight : AppColors.textLight;
  Color get surfaceColor =>
      isDark ? AppColors.darkCard : AppColors.surface;
  Color get scaffoldColor =>
      isDark ? AppColors.darkBg : AppColors.offWhite;
  Color get cardSurface =>
      isDark ? AppColors.darkSurface : AppColors.white;
  Color get creamColor =>
      isDark ? AppColors.darkCard : AppColors.cream;
  Color get dividerColor =>
      isDark ? AppColors.darkDivider : AppColors.surfaceDark;
  Color get progressBgColor =>
      isDark ? AppColors.darkDivider : AppColors.progressBg;
}
