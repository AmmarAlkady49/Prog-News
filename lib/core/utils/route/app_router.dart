import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prog_news/core/utils/route/app_routes.dart';
import 'package:prog_news/features/favorite/views/pages/favorites_page.dart';
import 'package:prog_news/features/global/views/pages/global_page.dart';
import 'package:prog_news/features/home/models/top_headlines_api_response.dart';
import 'package:prog_news/features/home/views/pages/home_page.dart';
import 'package:prog_news/features/product_details/views/pages/product_details_page.dart';
import 'package:prog_news/features/profile/views/pages/profile_page.dart';
import 'package:prog_news/features/search/views/pages/search_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return CupertinoPageRoute(builder: (context) => const HomePage());
      case AppRoutes.favorite:
        return CupertinoPageRoute(builder: (context) => const FavoritesPage());
      case AppRoutes.profile:
        return CupertinoPageRoute(builder: (context) => const ProfilePage());
      case AppRoutes.global:
        return CupertinoPageRoute(builder: (context) => const GlobalPage());
      case AppRoutes.productDetail:
        final Articles article = settings.arguments as Articles;
        return CupertinoPageRoute(
            builder: (context) => ProductDetailsPage(articles: article));
      case AppRoutes.search:
        return CupertinoPageRoute(builder: (context) => const SearchPage());
      default:
        return CupertinoPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
