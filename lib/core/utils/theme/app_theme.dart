import 'package:flutter/material.dart';
import 'package:prog_news/core/utils/theme/app_colors.dart';

class AppTheme {
  static final ThemeData mainTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    useMaterial3: true,
  );
}
