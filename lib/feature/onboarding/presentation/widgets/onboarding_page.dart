import 'package:auvnet_internship_assessment/core/common/widgets/custom_app_logo.dart';
import 'package:auvnet_internship_assessment/core/config/assets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_text_styles.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Image.asset(
            AppImages.onBoardingImage,
            width: 250.w,

            fit: BoxFit.cover,
          ),
        ),
        const CustomAppLogo(),

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(height: 500.h),
            Text(
              textAlign: TextAlign.center,
              title,
              style: AppTextStyles.onBoardingTitleText,
            ),
            SizedBox(height: 5.h),
            Text(
              description,
              style: AppTextStyles.onBoardingTitleDescription,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
