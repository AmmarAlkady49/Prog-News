import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prog_news/core/utils/theme/app_colors.dart';
import 'package:prog_news/core/utils/models/articles_api_response.dart';

class TitleOfNewspaperHeadlines extends StatelessWidget {
  final Articles articles;
  const TitleOfNewspaperHeadlines({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    final parsedDate =
        DateTime.parse(articles.publishedAt ?? DateTime.now().toString());
    final publishedDate = DateFormat.yMMMd().format(parsedDate);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              articles.source!.name ?? 'Unknown',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
            ),
            const SizedBox(width: 4),
            const Icon(
              CupertinoIcons.checkmark_seal_fill,
              color: AppColors.primary,
              size: 18,
            ),
            const SizedBox(width: 6),
            Text(
              publishedDate,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
            )
          ],
        ),
        const SizedBox(height: 2),
        Text(
          articles.title!,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
        )
      ],
    );
  }
}
