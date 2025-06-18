import 'package:auvnet_internship_assessment/core/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomShortcutWidget extends StatelessWidget {
  const CustomShortcutWidget({
    super.key,
    required this.imagePath,
    required this.text,
  });

  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 65.w,
          height: 65.h,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFFFEEE6),
          ),
          child: SvgPicture.asset(imagePath),
        ),
        SizedBox(height: 8.h),
        Text(
          text,
          style: AppTextStyles.font14BlackMedium.copyWith(fontSize: 12.sp),
        ),
      ],
    );
  }
}
