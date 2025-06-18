import 'package:auvnet_internship_assessment/core/config/theme/app_colors.dart';
import 'package:auvnet_internship_assessment/core/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPopularRestaurantWidget extends StatelessWidget {
  const CustomPopularRestaurantWidget({
    super.key,
    required this.imagePath,
    required this.text,
    required this.text2,
  });

  final String imagePath;
  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80.w,
          height: 70.h,
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGrey),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Image.network(imagePath),
        ),
        SizedBox(height: 8.h),
        Text(
          text,
          style: AppTextStyles.font14BlackMedium.copyWith(fontSize: 12.sp),
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            const Icon(
              Icons.access_time_rounded,
              size: 10,
              color: Color(0xFF1E1E1E),
            ),
            SizedBox(width: 3.h),
            Text(
              "$text2 min",
              style: AppTextStyles.font14BlackMedium.copyWith(
                fontSize: 12.sp,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
