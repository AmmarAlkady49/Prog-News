import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:prog_news/core/utils/route/app_routes.dart';
import 'package:prog_news/core/utils/theme/app_colors.dart';
import 'package:prog_news/core/utils/models/articles_api_response.dart';
import 'package:prog_news/features/home/views/widgets/title_of_newspaper_headlines.dart';

class CustomCarouselSlider extends StatefulWidget {
  final List<Articles> articles;
  const CustomCarouselSlider({super.key, required this.articles});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _current = 0;
  final _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final List<Widget> imageSliders = widget.articles
        .map((item) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.productDetail,
                    arguments: item);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 10.0,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                    child: Stack(
                      children: <Widget>[
                        CachedNetworkImage(
                          imageUrl: item.urlToImage ??
                              'https://nbhc.ca/sites/default/files/styles/article/public/default_images/news-default-image%402x_0.png?itok=B4jML1jF',
                          fit: BoxFit.cover,
                          width: 1000.0,
                          height: size.height * 1,
                          placeholder: (context, url) =>
                              LoadingAnimationWidget.flickr(
                            leftDotColor: AppColors.primary,
                            rightDotColor: AppColors.grey3,
                            size: 40,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        Positioned(
                            left: 0,
                            top: 0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: Container(
                                height: size.height * 0.04,
                                width: size.width * 0.22,
                                decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                  child: Text('General',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500)),
                                ),
                              ),
                            )),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: [0.05, 1.0],
                              ),
                            ),
                            padding: const EdgeInsets.only(
                                bottom: 15.0, left: 20.0, right: 20),
                            child: TitleOfNewspaperHeadlines(
                                articles: widget.articles[_current]),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
    return Column(children: [
      Expanded(
        child: CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 15 / 9,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.articles.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: _current == entry.key ? 24.0 : 12.0,
              height: 9.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 1.5),
              decoration: BoxDecoration(
                  borderRadius:
                      _current == entry.key ? BorderRadius.circular(10) : null,
                  shape: _current == entry.key
                      ? BoxShape.rectangle
                      : BoxShape.circle,
                  color: _current == entry.key
                      ? AppColors.primary.withOpacity(0.95)
                      : AppColors.grey3),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
