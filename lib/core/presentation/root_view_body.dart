import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/core/constants/app_colors.dart';
import 'package:news_app/features/explore/presentation/views/explore_view.dart';
import 'package:news_app/features/home/presentation/views/home_view.dart';
import 'package:news_app/features/profile/presentation/views/profile_view.dart';
import 'package:news_app/features/saved/presentation/views/saved_view.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class RootViewBody extends StatelessWidget {
  const RootViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: HomeView(),
          item: ItemConfig(
            inactiveIcon: FaIcon(FontAwesomeIcons.house, size: 22),
            icon: FaIcon(FontAwesomeIcons.solidHouse, size: 25),
            title: 'Home',

            activeColorSecondary: AppColors.primaryColors,
            activeForegroundColor: Colors.white,
          ),
        ),
        PersistentTabConfig(
          screen: ExploreView(),
          item: ItemConfig(
            inactiveIcon: FaIcon(FontAwesomeIcons.compass, size: 28),
            icon: FaIcon(FontAwesomeIcons.solidCompass, size: 28),

            title: 'EXPLORE',
            activeColorSecondary: AppColors.primaryColors,
            activeForegroundColor: Colors.white,
          ),
        ),
        PersistentTabConfig(
          screen: SavedView(),
          item: ItemConfig(
            inactiveIcon: FaIcon(FontAwesomeIcons.bookmark, size: 22),
            icon: FaIcon(FontAwesomeIcons.solidBookmark, size: 25),
            title: 'SAVED',
            activeColorSecondary: AppColors.primaryColors,
            activeForegroundColor: Colors.white,
          ),
        ),
        PersistentTabConfig(
          screen: ProfileView(),
          item: ItemConfig(
            activeColorSecondary: AppColors.primaryColors,
            activeForegroundColor: Colors.white,
            inactiveIcon: FaIcon(FontAwesomeIcons.user, size: 22),
            icon: FaIcon(FontAwesomeIcons.solidUser, size: 25),
            title: 'Profile',
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style2BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(),
        height: 60,
        itemAnimationProperties: ItemAnimation(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
        itemPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      ),
    );
  }
}
