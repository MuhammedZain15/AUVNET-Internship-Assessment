import 'package:auvnet_internship_assessment/core/config/theme/app_text_styles.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/bloc/location_service_bloc/location_bloc.dart';
import 'package:auvnet_internship_assessment/feature/home/presentation/bloc/location_service_bloc/location_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Delivering to', style: AppTextStyles.homeStyleLarge),
            SizedBox(height: 4.h),
            if (state.isLoading)
              const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              )
            else if (state.error != null)
              Text(
                'Error: ${state.error}',
                style: AppTextStyles.homeStyleMed.copyWith(
                  color: Colors.red[100],
                ),
              )
            else
              Text(
                state.location?.formattedAddress ?? 'Location unavailable',
                style: AppTextStyles.homeStyleMed,
              ),
          ],
        );
      },
    );
  }
}
