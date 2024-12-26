import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prog_news/features/home/views/widgets/my_custom_icon.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 12.0, bottom: 18.0),
      child: Row(
        children: [
          MyCustomIcon(onTap: () {}, icon: CupertinoIcons.line_horizontal_3),
          const Spacer(),
          MyCustomIcon(onTap: () {}, icon: Iconsax.search_normal_14),
          const SizedBox(width: 8),
          MyCustomIcon(onTap: () {}, icon: Iconsax.notification),
        ],
      ),
    );
  }
}
