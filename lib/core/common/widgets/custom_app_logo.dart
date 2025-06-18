import 'package:auvnet_internship_assessment/core/config/assets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppLogo extends StatelessWidget {
  const CustomAppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(

      left: 20.w,
      top: 100.h,
      child:  Image.asset(AppImages.appLogo, width: 350.w),
    );
  }
}
