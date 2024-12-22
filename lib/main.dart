import 'package:flutter/material.dart';
import 'package:prog_news/core/utils/app_constants.dart';
import 'package:prog_news/core/utils/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.mainTheme,
      // home: const BottomNavBar(),
    );
  }
}
