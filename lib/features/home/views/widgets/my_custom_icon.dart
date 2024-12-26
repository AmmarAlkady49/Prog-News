import 'package:flutter/material.dart';
import 'package:prog_news/core/utils/theme/app_colors.dart';

class MyCustomIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const MyCustomIcon({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      hoverColor: Colors.black,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.grey3.withOpacity(0.3),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                color: Colors.black.withOpacity(.1),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(icon),
        ),
      ),
    );
  }
}
