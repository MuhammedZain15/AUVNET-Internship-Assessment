import 'package:auvnet_internship_assessment/core/config/assets/app_images.dart';
import 'package:auvnet_internship_assessment/core/config/theme/app_colors.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/bloc/location_service_bloc/location_bloc.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/bloc/user_profile_bloc/user_profile_bloc.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/widgets/location_section.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/widgets/user_profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class HomeBarWidget extends StatefulWidget {
  const HomeBarWidget({super.key});

  @override
  State<HomeBarWidget> createState() => _HomeBarWidgetState();
}

class _HomeBarWidgetState extends State<HomeBarWidget> {
  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    // Initialize location
    if (!mounted) return;
    context.read<LocationBloc>().add(FetchLocationEvent());

    // Initialize user profile
    try {
      final box = await Hive.openBox('authBox');
      final userId = box.get('userId');
      if (userId != null && mounted) {
        context.read<UserProfileBloc>().add(FetchUserProfileEvent(userId));
      }
    } catch (e) {
      debugPrint('Error fetching user profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 156.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        gradient: const LinearGradient(
          colors: [AppColors.primaryColor, AppColors.homeGradientColor],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.h, vertical: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LocationSection(),
                SizedBox(height: 7.h),
                const UserProfileSection(),
              ],
            ),
            Image.asset(
              AppImages.girlImages,
              width: 80.w,
              height: 80.h,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
