import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prog_news/core/utils/theme/app_colors.dart';
import 'package:prog_news/features/home/models/top_headlines_api_response.dart';

class TitleOfProductDetailsWidget extends StatelessWidget {
  final Articles articles;
  const TitleOfProductDetailsWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final parsedDate =
        DateTime.parse(articles.publishedAt ?? DateTime.now().toString());
    final publishedDate = DateFormat.yMMMd().format(parsedDate);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height * 0.04,
            width: size.width * 0.22,
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text('General',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500)),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            articles.title ?? 'Unknown',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                'Trending',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.grey3),
              ),
              const SizedBox(width: 8),
              Text(
                publishedDate,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.grey3),
              ),
            ],
          )
        ],
      ),
    );
  }
}
