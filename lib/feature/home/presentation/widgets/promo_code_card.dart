import 'package:auvnet_internship_assessment/core/config/assets/app_images.dart';
import 'package:auvnet_internship_assessment/core/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoCodeCard extends StatelessWidget {
  const PromoCodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          children: [
            Image.asset(AppImages.promoCodeImage, width: 85.w, height: 85.h),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Got a code!', style: AppTextStyles.font16BlackRegular),
                  Text(
                    'Add your code and save on your\norder',
                    style: AppTextStyles.font10GreyRegular,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
