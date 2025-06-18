import 'package:auvnet_internship_assessment/core/config/app_data.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/widgets/service_card_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceCardListView extends StatelessWidget {
  ServiceCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: AppData.serviceCards.length,
        itemBuilder: (context, index) {
          final item = AppData.serviceCards[index];
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: ServiceCardWidget(
              image: item['image']!,
              desc: item['desc']!,
              title: item['title']!,
            ),
          );
        },
      ),
    );
  }
}
