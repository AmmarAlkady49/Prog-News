import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prog_news/features/home/models/top_headlines_api_response.dart';
import 'package:prog_news/features/product_details/views/widgets/body_of_product_details_widget.dart';
import 'package:prog_news/features/product_details/views/widgets/product_details_app_bar.dart';
import 'package:prog_news/features/product_details/views/widgets/title_of_product_details_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  final Articles articles;
  const ProductDetailsPage({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      // appBar: AppBar(title: const Text('Product Details')),
      body: Stack(
        children: [
          // Image
          CachedNetworkImage(
            imageUrl: articles.urlToImage ??
                'https://nbhc.ca/sites/default/files/styles/article/public/default_images/news-default-image%402x_0.png?itok=B4jML1jF',
            fit: BoxFit.cover,
            height: size.height * 0.52,
          ),
          // Black gradient
          Container(
            height: size.height * 0.5,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.center,
                begin: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.1),
                ],
              ),
            ),
          ),
          // AppBar
          Positioned(
            top: size.height * 0.06,
            left: 12,
            right: 12,
            child: const ProductDetailsAppBar(),
          ),
          // Title of article
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.25),
            child: Column(
              children: [
                TitleOfProductDetailsWidget(articles: articles),
                // Body
                const SizedBox(height: 4),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(42),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 24),
                      child: BodyOfProductDetailsWidget(articles: articles),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
