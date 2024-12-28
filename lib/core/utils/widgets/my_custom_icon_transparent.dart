import 'package:flutter/material.dart';
import 'package:prog_news/core/utils/theme/app_colors.dart';

class MyCustomIconTransparent extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const MyCustomIconTransparent({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      hoverColor: Colors.black,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.test.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }
}
