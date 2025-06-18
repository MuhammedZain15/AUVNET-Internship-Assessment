import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/nearby_restaurant_bloc/nearby_restaurant_bloc.dart';
import '../bloc/nearby_restaurant_bloc/nearby_restaurant_event.dart';
import '../bloc/nearby_restaurant_bloc/nearby_restaurant_state.dart';
import 'custom_popular_restaurant_widget.dart';
import 'package:auvnet_internship_assessment/core/common/helper/service_locator.dart';

class CustomPopularRestaurantListView extends StatelessWidget {
  const CustomPopularRestaurantListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NearbyRestaurantBloc(sl())..add(LoadNearbyRestaurants()),
      child: BlocBuilder<NearbyRestaurantBloc, NearbyRestaurantState>(
        builder: (context, state) {
          if (state is NearbyRestaurantLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NearbyRestaurantLoaded) {
            final restaurants = state.restaurants;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 140.h,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: restaurants.length,
                    itemBuilder: (context, index) {
                      final item = restaurants[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: CustomPopularRestaurantWidget(
                          imagePath: item.imageUrl,
                          text: item.restaurantName,
                          text2: item.time,
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is NearbyRestaurantError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
