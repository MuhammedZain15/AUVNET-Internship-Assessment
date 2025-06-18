import 'package:auvnet_internship_assessment/core/config/theme/app_text_styles.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/widgets/custom_shortcuts_list_view.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/widgets/home_bar_widget.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/widgets/promo_code_card.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/widgets/service_card_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_popular_restaurant_list_view.dart';
import '../widgets/home_slider_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeBarWidget(),
          SizedBox(height: 6.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: Text(
              textAlign: TextAlign.start,
              "Services:",
              style: AppTextStyles.homeStyleBlack,
            ),
          ),
          SizedBox(height: 19.h),
          ServiceCardListView(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: const PromoCodeCard(),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: Text(
              textAlign: TextAlign.start,
              "Shortcuts:",
              style: AppTextStyles.homeStyleBlack,
            ),
          ),

          const CustomShortcutsListView(),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.h),
            child: const HomeSliderWidget(),
          ),
          SizedBox(height: 34.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: Text(
              textAlign: TextAlign.start,
              "Nearby Restaurants :",
              style: AppTextStyles.homeStyleBlack,
            ),
          ),
          const CustomPopularRestaurantListView(),
        ],
      ),
    );
  }
}
