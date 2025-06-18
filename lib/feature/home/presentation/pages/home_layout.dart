import 'package:auvnet_internship_assessment/core/config/theme/app_colors.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';


class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _LayoutState();
}

class _LayoutState extends State<HomeLayout> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: 'Home',
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.navBarIconColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.category),
        title: 'Categories',
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.navBarIconColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.local_shipping),
        title: 'Deliver',
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.navBarIconColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: 'Cart',
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.navBarIconColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: 'Profile',
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.navBarIconColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,

      navBarStyle: NavBarStyle.style3,
    );
  }
}
