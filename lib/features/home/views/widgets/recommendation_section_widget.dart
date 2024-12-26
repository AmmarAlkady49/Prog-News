import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:prog_news/core/utils/theme/app_colors.dart';
import 'package:prog_news/features/home/models/top_headlines_api_response.dart';

class RecommendationSectionWidget extends StatelessWidget {
  final Articles articles;
  const RecommendationSectionWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final publishedAt = DateFormat.yMMMd().format(
        DateTime.parse(articles.publishedAt ?? DateTime.now().toString()));
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          child: CachedNetworkImage(
            imageUrl: articles.urlToImage ??
                'https://nbhc.ca/sites/default/files/styles/article/public/default_images/news-default-image%402x_0.png?itok=B4jML1jF',
            fit: BoxFit.cover,
            width: size.width * 0.35,
            height: size.height * 0.18,
            placeholder: (context, url) => LoadingAnimationWidget.flickr(
              leftDotColor: AppColors.primary,
              rightDotColor: AppColors.grey3,
              size: 40,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: SizedBox(
            height: size.height * 0.16,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  articles.author ?? 'Unknown',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black38,
                      fontFamily: 'HindMysuru'),
                ),
                Text(
                  articles.title ?? 'Unknown',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: 'HindMysuru'),
                ),
                Text(
                  '${articles.source!.name?.split('.').first} . $publishedAt',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black38,
                      fontFamily: 'HindMysuru'),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
