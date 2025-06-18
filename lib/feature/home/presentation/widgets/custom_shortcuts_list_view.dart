import 'package:auvnet_internship_assessment/core/config/app_data.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/widgets/custom_shortcuts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShortcutsListView extends StatelessWidget {
 const CustomShortcutsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 19.h),
        SizedBox(
          height: 110.h,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            scrollDirection: Axis.horizontal,
            itemCount: AppData.shortcuts.length,
            itemBuilder: (context, index) {
              final item = AppData.shortcuts[index];
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: CustomShortcutWidget(
                  imagePath: item['image']!,
                  text: item['text']!,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
