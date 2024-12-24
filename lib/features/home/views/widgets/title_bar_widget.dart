import 'package:flutter/material.dart';
import 'package:prog_news/core/utils/theme/app_colors.dart';

class TitleBarWidget extends StatelessWidget {
  final String titleName;
  final VoidCallback? onPress;
  const TitleBarWidget({super.key, required this.titleName, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleName,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600, fontFamily: 'HindMysuru'),
          ),
          TextButton(
              onPressed: onPress,
              child: Text(
                'View All',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'HindMysuru'),
              ))
        ],
      ),
    );
  }
}
