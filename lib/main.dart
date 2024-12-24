import 'package:flutter/material.dart';
import 'package:prog_news/core/utils/app_constants.dart';
import 'package:prog_news/core/utils/route/app_router.dart';
import 'package:prog_news/core/utils/theme/app_theme.dart';
import 'package:prog_news/google_bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.mainTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: const GoogleBottomNavBar(),
    );
  }
}
