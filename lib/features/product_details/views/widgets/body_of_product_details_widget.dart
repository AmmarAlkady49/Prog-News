import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:prog_news/core/utils/theme/app_colors.dart';
import 'package:prog_news/core/utils/models/articles_api_response.dart';

class BodyOfProductDetailsWidget extends StatelessWidget {
  final Articles articles;
  const BodyOfProductDetailsWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                child: CachedNetworkImage(
                  imageUrl: articles.urlToImage ??
                      'https://nbhc.ca/sites/default/files/styles/article/public/default_images/news-default-image%402x_0.png?itok=B4jML1jF',
                  fit: BoxFit.cover,
                  width: 45,
                  height: 45,
                  placeholder: (context, url) => LoadingAnimationWidget.flickr(
                    leftDotColor: AppColors.primary,
                    rightDotColor: AppColors.grey3,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                articles.source?.name ?? 'Unknown',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
              ),
              const SizedBox(width: 4),
              const Icon(
                CupertinoIcons.checkmark_seal_fill,
                color: AppColors.primary,
                size: 18,
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            (articles.description)! * 2,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87.withOpacity(0.7),
                ),
          ),
          const SizedBox(height: 10),
          Text(
            (articles.title)! * 3,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87.withOpacity(0.7),
                ),
          ),
          const SizedBox(height: 10),
          Text(
            (articles.description)! * 2,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87.withOpacity(0.7),
                ),
          ),
        ],
      ),
    );
  }
}
