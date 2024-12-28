import 'package:flutter/material.dart';
import 'package:prog_news/features/home/views/widgets/my_custom_icon.dart';
import 'package:prog_news/core/utils/widgets/my_custom_icon_transparent.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyCustomIconTransparent(
            icon: Icons.arrow_back_ios_new_outlined,
            onTap: () => Navigator.pop(context),
          ),
          Row(
            children: [
              MyCustomIconTransparent(
                icon: Icons.favorite_border,
                onTap: () {},
              ),
              const SizedBox(width: 8),
              MyCustomIconTransparent(
                icon: Icons.share,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
