import 'package:auvnet_internship_assessment/core/config/theme/app_colors.dart';
import 'package:auvnet_internship_assessment/core/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceCardWidget extends StatelessWidget {
  final String image;
  final String desc;
  final String title;

  const ServiceCardWidget({
    super.key,
    required this.image,
    required this.desc,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
            decoration: BoxDecoration(
              color: const Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Image.asset(image, height: 60.h),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(13.r),
            ),
            child: Text(desc, style: AppTextStyles.font12whiteMedium),
          ),
          Text(title, style: AppTextStyles.font14BlackMedium),
        ],
      ),
    );
  }
}
