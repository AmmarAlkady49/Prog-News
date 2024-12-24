import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_icons/line_icons.dart';
import 'package:prog_news/core/utils/theme/app_colors.dart';
import 'package:prog_news/features/favorite/views/pages/favorites_page.dart';
import 'package:prog_news/features/global/views/pages/global_page.dart';
import 'package:prog_news/features/home/home_cubit/home_cubit.dart';
import 'package:prog_news/features/home/views/pages/home_page.dart';
import 'package:prog_news/features/profile/views/pages/profile_page.dart';

class GoogleBottomNavBar extends StatefulWidget {
  const GoogleBottomNavBar({super.key});

  @override
  State<GoogleBottomNavBar> createState() => _GoogleBottomNavBarState();
}

class _GoogleBottomNavBarState extends State<GoogleBottomNavBar> {
  int _selectedIndex = 0;

  static final List<Widget> _pageOptions = [
    BlocProvider(
      create: (context) {
        final cubit = HomeCubit();
        cubit.getTopHeadLines();
        return cubit;
      },
      child: const HomePage(),
    ),
    const GlobalPage(),
    const FavoritesPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey[300]!, width: 1)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              hoverColor: Colors.grey[300]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: AppColors.primary,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Iconsax.home4,
                  iconColor: Colors.black45,
                  text: 'Home',
                ),
                GButton(
                  icon: Iconsax.global,
                  iconColor: Colors.black45,
                  text: 'Global',
                ),
                GButton(
                  icon: CupertinoIcons.bookmark,
                  iconColor: Colors.black45,
                  text: 'Saved',
                ),
                GButton(
                  iconColor: Colors.black45,
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
